# Home Drone CI 
The Drone server  is running in a docker container only setup with http, however the reverse proxy is doing it's https termination.  A known good env configuration looks like:

```bash
DRONE_SERVER_HOST=drone.mattsnoby.com
DRONE_SERVER_PROTO=http
DRONE_RPC_SECRET=stripped
DRONE_LOGS_PRETTY=true
DRONE_USER_CREATE=username:snoby,admin:true
DRONE_GITHUB_SERVER=https://github.com
DRONE_GITHUB_CLIENT_ID=stripped
DRONE_GITHUB_CLIENT_SECRET=stripped
DRONE_GITHUB_DEBUG=true
DRONE_GIT_ALWAYS_AUTH=true
DRONE_RUNNER_CAPACITY=6
LETSENCRYPT_HOST=drone.mattsnoby.com
LETSENCRYPT_EMAIL=matt.snoby@icloud.com
ACME_CA_URI=https://api.buypass.com/acme/directory
VIRTUAL_HOST=drone.mattsnoby.com
VIRTUAL_PORT=80
VIRTUAL_PROTOCOL=http
DRONE_PROMETHEUS_ANONYMOUS_ACCESS=true
```

The docker run command which is in a systemd file looks like this
```bash
[Unit]
Description=Drone running in docker container
# Start this unit only after docker has started
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
#needs to be fixed User = drone
# Group = drone
# The following lines start with '-' because they are allowed to fail without
# causing startup to fail.
#
# Kill the old instance, if it's still running for some reason
ExecStartPre=-/usr/bin/docker stop drone-server
# Remove the old instance, if it stuck around
ExecStartPre=-/usr/bin/docker rm drone-server
ExecStart=/usr/bin/docker run --name drone-server \
   -v /var/run/docker.sock:/var/run/docker.sock \
    -v /mnt/data/drone:/data \
  -p :80 \
  -p :443 \
--env-file /etc/drone/drone-server.env \
--restart=always        \
drone/drone:1.10.0


# On exit, stop the container
ExecStop=/usr/bin/docker stop drone-server
ExecStop=-/usr/bin/docker rm drone-server
[Install]
WantedBy=multi-user.target
```

Notice, I'm not exposing anything to the host, everything has to go through the front end proxy.  However other containers on the same docker network can get to port 80 and 443

## Drone configs tweaks
To setup a config that only builds on the  pushes of commits and then  does a full build and deploy to master on the merge to master,  setup the rules to look like this:

 Notice the GLOBAL trigger setup on line 75

```yaml
---
kind: pipeline
type: docker
name: default

trigger:
  event:
    - push

platform:
  os: linux
  arch: amd64

steps:
  - name: build_site
    image: iotapi322/docs:latest
    commands:
      - mkdocs build

  - name: deploy_site
    image: appleboy/drone-scp
    settings:
      host: dockerhost
      user: snoby
      port: 22
      key:
        from_secret: SSH_KEY
      target: /mnt/data/docs/
      source: site
      rm: true
    when:
      branch: master
```
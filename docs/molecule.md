# Molecule

Molecule is a test frame work for ansible playbooks.  It's finiky on it's setup but once you have it figured out it's very useful.

Things to know.

1.) When using with drone your drone config has to have the name of the role as it's workspace.  For example if the name of the role is 'monitoring' then you have to have the following two config lines in your drone yaml:
```yaml
# Need to define workspace as role name so molecule can find it
workspace:
  path: /drone/monitoring
```


2.) When running molecule in drone your running docker in docker in docker.

3.) For the molecule.yml you need to setup  the lint as follows:
```yaml
lint: |
  set -e
  yamllint .
  ansible-lint
```

For the platform section, especially if you are using a systemd image  setup the yaml to export the cgroups and run as privileged:
```yaml
platforms:
  - name: ubuntu
    image: geerlingguy/docker-ubuntu2004-ansible
    #image: iotapi322/moleculetester
    command: "/lib/systemd/systemd"
    pre_build_image: true
    tmpfs:
      - /run
      - /tmp
    capabilities:
      - SYS_ADMIN
    privileged: True
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
```


Complete example:
```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: ubuntu
    image: geerlingguy/docker-ubuntu2004-ansible
    #image: iotapi322/moleculetester
    command: "/lib/systemd/systemd"
    pre_build_image: true
    tmpfs:
      - /run
      - /tmp
    capabilities:
      - SYS_ADMIN
    privileged: True
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
provisioner:
  name: ansible
  config_options:
    defaults:
      callback_whitelist: profile_tasks, timer, yaml
verifier:
  name: ansible
lint: |
  set -e
  yamllint .
  ansible-lint .

```
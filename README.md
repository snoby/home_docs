# home_docs

This repository holds all the documenation for the home lab / home network.  It is hosted internally at http:///docs.mattsnoby.com. This is not available to the general public.

There are no passwords or usernames in this documentation, that is hosted on another private repository and not for general consumption.

To build the documentation:
```
cd tools && ./local_build_docs.sh
```

To locally test serve the docs site:
```
cd tools && ./local_serve_docs.sh
```
To build the docker image that runs the mkdoc process

```
cd src && ./build.sh

```
#!/bin/bash
source ../src/insider/version.env
cd .. && docker run --rm  -p 8000:8000 -v ${PWD}:/docs "${CONTAINER_NAME_LATEST}" serve --dev-addr 0.0.0.0:8000 --livereload


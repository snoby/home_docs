#!/bin/bash
source ../src/version.env
cd .. && docker run --rm -v ${PWD}:/docs "${CONTAINER_NAME_LATEST}" build


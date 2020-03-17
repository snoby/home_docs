CWD := $(shell pwd)/src
TAG := latest
PORT := 8080
IMAGE := "snoby/mkdocs:$(TAG)"
SOME_CONTAINER := $(shell echo some-$(IMAGE) | sed 's/[^a-zA-Z0-9]//g')
DOCKERFILE := $(CWD)/Dockerfile


.PHONY: all
all: clean build

.DEFAULT_GOAL:= docs

.PHONY: build
build:
	docker build -t $(IMAGE) -f $(DOCKERFILE) $(CWD)
	@echo ::: BUILD :::


.PHONY: docs
docs:
	docker run --rm  -it -v $(PWD)/docs:/docs  $(IMAGE) build

.PHONY: clean
clean:
	@echo ::: CLEAN :::

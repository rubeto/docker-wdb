#!/bin/bash
DOCKER_REPO=rubeto
time docker build --no-cache=true -t ${DOCKER_REPO}/wdb:3.3.0 .
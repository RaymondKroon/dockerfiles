#!/usr/bin/env bash

pushd "$(dirname "$0")" > /dev/null

set -e

dockerfiles=( "$1" )
if [[ -z $1 ]]; then
    dockerfiles=( $(find . -name "Dockerfile") )
fi

for f in "${dockerfiles[@]}"
do
   build_dir=$(dirname ${f})
   dir=${f%/Dockerfile}
   image=${dir##*/}
   echo "Building $image"

   docker build --rm -t rayray/$image:latest $build_dir

   if [ -n "$DOCKER_PUSH" ]; then
        echo "PUSHING"
        docker push rayray/$1:latest
   fi

done
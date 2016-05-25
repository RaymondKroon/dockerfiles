#!/bin/bash

pushd "$(dirname "$0")" > /dev/null

set -e

git_revison="$1"
if [[ -z $1 ]]; then
    git_revision="HEAD"
fi

echo "$git_revision"

changed_files=( $(git diff-tree --no-commit-id --name-only -r -M $git_revision | grep Dockerfile) )

for f in "${changed_files[@]}"
do
   build_dir=$(dirname ${f})
   image=${f%/Dockerfile}
   echo "Building $image"

   docker build --rm -t rayray/$image:latest $build_dir

   if [ -n "$DOCKER_PUSH" ]; then
        echo "PUSHING"
        docker push rayray/$1:latest
   fi

done
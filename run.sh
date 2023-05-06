#!/bin/bash
workdir=$(cd "$(dirname "$0")";pwd) || exit
printf "current work directory: %s\n" "$workdir"
cd "$workdir" || exit
printf "create docker directory...\n"
mkdir -p /mnt/docker
printf "copy resources into new directory...\n"
cp -R ./ /mnt/docker
cd /mnt/docker
printf "running docker compose...\n"
docker-compose up -d
printf "finish\n"

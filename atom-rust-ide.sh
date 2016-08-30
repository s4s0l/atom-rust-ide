#!/bin/bash
set -e
if [[ ( -z ${1} ) ]]; then
	PROJECT=atom-rust-ide-project
	IMAGE_NAME=atom-rust-ide-project
else
	PROJECT=$1
	if [ ! -d $PROJECT ]; then
		echo "Creating Project Dir..."
		mkdir -p $PROJECT
	fi
	PROJECT=$(cd $PROJECT; pwd)
	IMAGE_NAME=atom_rust_ide_${PROJECT//\//_}
fi

echo Opening Project $PROJECT with container name $IMAGE_NAME



docker ps -a -f name=$IMAGE_NAME | grep $IMAGE_NAME \
&& \
docker start $IMAGE_NAME \
|| \
docker run \
	-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
	-v /dev/shm:/dev/shm       \
	-v $PROJECT:/home/atom/project                  \
	-v atom-rust-ide-config:/home/atom/.atom \
	-e DISPLAY=$DISPLAY  \
	--name $IMAGE_NAME \
	atom-rust-ide


#! /bin/sh

imageName='resume-build-env'
containerName='resume-build'

if [[ "$(docker images -q $imageName:latest 2> /dev/null)" == "" ]]; then
	docker build build -t $imageName:latest
fi

mkdir -p dist

[[ $(docker ps -f "name=$containerName" --format '{{.Names}}') == $containerName ]] ||
	docker run -d --name $containerName -v "$PWD/src":/input -v "$PWD/dist":/output resume-build-env

docker exec $containerName /bin/sh -c "./home/generate_pdf.sh"

docker rm -f $containerName

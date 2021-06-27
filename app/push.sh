#!/bin/bash

repo=SET_YOUR_ECR_ARN
image=SET_YOUR_IMAGE_NAME

dfile=Dockerfile.apprunner1

aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin $repo
docker build -t $image -f $dfile .
docker tag $image:latest $repo/$image:latest
docker push $repo/$image:latest

#!/bin/bash
if [[ $GIT_BRANCH == "dev" ]];then
sh'chmod +x build.sh'
sh'./build.sh'
docker login -u jegrag04 -p Twenty7feb%
docker tag cap-project jegrag04/dev:cap-repo
docker push jegrag04/dev:cap-repo

elif [[ $GIT_BRANCH == "main" ]];then
sh'chmod +x build.sh'
sh'./build.sh'
docker login -u jegrag04 -p Twenty7feb%
docker tag cap-project jegrag04/prod:cap-repo
docker push jegrag04/prod:cap-repo

fi

#!/bin/sh
# 打印错误
# set -e  
# set -x
BRANCH=v1_cn

LOCAL=$(git log $BRANCH -n 1 --pretty=format:"%H")

# git pull origin $BRANCH
git pull

REMOTE=$(git log refs/remotes/origin/$BRANCH -n 1 --pretty=format:"%H")

if [ $LOCAL = $REMOTE ]; then
    echo "Not update, finish"
else
    echo "Need update, run deploy.sh"
    ./deploy.sh
fi

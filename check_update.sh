#!/bin/sh

BRANCH=v1_cn

LOCAL=$(git log $BRANCH -n 1 --pretty=format:"%H")

git pull origin $BRANCH

REMOTE=$(git log refs/remotes/origin/$BRANCH -n 1 --pretty=format:"%H")

if [ $LOCAL = $REMOTE ]; then
    echo "Not update, finish"
else
    sh ./deploy.sh
fi

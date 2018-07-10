#!/usr/bin/env bash
heroku_git_url=$1
my_app_directory=$2
cd ${my_app_directory}
git remote remove origin
git remote add origin ${heroku_git_url}
git add --all
git commit -m "dev"
git push origin master
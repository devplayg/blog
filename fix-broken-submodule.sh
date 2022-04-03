#!/bin/zsh

git submodule init
git submodule sync
git submodule update --remote
git commit * -m "fixed"
git push origin master

cd public
git checkout master
cd ..

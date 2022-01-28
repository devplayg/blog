@echo off
git submodule init
git submodule sync
git submodule update --remote
git commit * -m "fixed"
git push origin master
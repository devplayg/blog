@echo off
hugo -t hyde
cd public
git add .

git commit -m "commit"
git push origin master
cd ..

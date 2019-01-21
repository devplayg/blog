@echo off
hugo -t hyde
cd public
git add .
cd ..
git content
git add .
cd ..
git commit -m "commit"
git push origin master
cd ..


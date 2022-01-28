hugo -t hyde-hyde

cd public
git add .
git commit -m "changed"
git push origin +master

cd ..
git add .
git commit -m "changed"
rem git push origin +master
git push --recurse-submodules=check

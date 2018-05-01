$branchname = "release-$(node -p -e "require('./package.json').version")"
git push -u origin $branchname
git checkout production
git reset --hard
git merge --no-ff $branchname
git push
git push --tags
git checkout master
git merge --no-ff $branchname
git push
npm run build
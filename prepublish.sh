version=$(node -p -e "require('./package.json').version")
branchname="release-$version"
git push -u origin $branchname
git checkout production
git reset --hard
git merge --no-ff --no-edit $branchname
git push
git push --tags
git checkout master
git merge --no-ff --no-edit $branchname
git push
npm run build
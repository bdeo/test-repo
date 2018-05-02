version=$(node -p -e "require('./package.json').version")
branchname="release-$version"
git commit -a -m"bump version number"
git push -u origin $branchname
git checkout production
git reset --hard
git merge --no-ff --no-edit $branchname
git tag $version
git push origin --tags
git checkout master
git merge --no-ff --no-edit $branchname
git push origin production master
npm run build

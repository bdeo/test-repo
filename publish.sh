git push -u "release-$(node -p -e 'require('./package.json').version')"
git checkout production
git reset --hard
git merge --no-ff "release-$(node -p -e 'require('./package.json').version')"
git push
git push --tags
git checkout master
git merge --no-ff "release-$(node -p -e 'require('./package.json').version')"
git push
npm run build
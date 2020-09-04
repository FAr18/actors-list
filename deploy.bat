cd dist
git init
git add -A
git commit -m 'deploy'
git push -f https://github.com/FAr18/actors-list.git master:gh-pages

#!/bin/bash

echo "The script will remove all environment setup"

echo "Removing brew"

if ! type "brew" > /dev/null 2>&1; then
  echo "brew is not found, it seems that everything is clean already"
  exit 0
fi

cd `brew --prefix`
git checkout master
git ls-files -z | pbcopy
rm -rf Cellar
bin/brew prune
pbpaste | xargs -0 rm
rm -r Library/Homebrew Library/Aliases Library/Formula Library/Contributions 
test -d Library/LinkedKegs && rm -r Library/LinkedKegs
rmdir -p bin Library share/man/man1 2> /dev/null
rm -rf .git
rm -rf ~/Library/Caches/Homebrew
rm -rf ~/Library/Logs/Homebrew
sudo rm -rf /Library/Caches/Homebrew

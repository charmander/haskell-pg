#!/bin/bash

echo "Generating CHANGELOG.md"
echo

cat <<HEADER > CHANGELOG.md
For the full changelog, see
<https://github.com/charmander/haskell-pg/blob/master/CHANGES.md>

HEADER

perl -ne '$n++ if /^###/; exit if $n==2; print' CHANGES.md >> CHANGELOG.md

cat CHANGELOG.md
rm -f ./dist/*.tar
rm -f ./dist/*.tar.gz
cabal sdist
cd dist
ls -lh *.tar.gz
gunzip *.gz
ls -lh *.tar
zopfli *.tar
ls -lh *.tar.gz
cd ..
rm -f ./dist/*.tar

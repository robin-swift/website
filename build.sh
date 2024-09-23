#!/bin/sh

echo "```" > docs/testing.md
cat test_report/* >> docs/testing.md
echo "```" >> docs/testing.md

git clone https://github.com/embroidermodder/userman
git clone https://github.com/embroidermodder/refman

python3 -m pip install --upgrade pip

pip install mkdocs
pip install mkdocs-bibtex
pip install mkdocs-with-pdf
pip install mkdocs-material
pip install mkdocs-table-reader-plugin
pip install markdown-grid-tables

rm -fr _site

mkdocs build

mv site _site

#!/bin/sh

python3 -m pip install --upgrade pip

pip install mkdocs
pip install mkdocs-bibtex
pip install mkdocs-with-pdf
pip install mkdocs-material
pip install mkdocs-table-reader-plugin
pip install markdown-grid-tables

rm -fr _site

mkdocs .

mv site _site
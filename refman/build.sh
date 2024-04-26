#!/bin/bash

python3 -m pip install --upgrade pip

pip install mkdocs
pip install mkdocs-bibtex
pip install mkdocs-with-pdf
pip install mkdocs-material

mkdocs build

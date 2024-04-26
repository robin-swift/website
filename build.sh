#!/bin/bash
#
# Lighter weight hugo/jekyll style static site generator.

function make_page () {
	pandoc content/$1.md -o content/$1.html
	cat head.html content/$1.html foot.html > _site/$1.html
}

function build_emscripten_version () {
	git clone https://github.com/embroidermodder/libembroidery
	cd libembroidery
	emcc embroidery.c -o embroidery.wasm
	mv embroidery.wasm ../downloads
}

function build_subproject () {
	git clone https://github.com/embroidermodder/$1
	cd $1
		bash build.sh
	cd ..
	cp -r $1/site _site/$1
}

#build_emscripten_version

git submodule init
git submodule update

rm -fr _site
mkdir -p _site
cp -R downloads commands images icons samples fonts favicon.png _site

for file in index downloads about changelog credits documentation todo converter
do
	make_page $file
done

build_subproject refman
build_subproject user-manual

#!/bin/bash
#
# Lighter weight hugo/jekyll style static site generator.

function make_page () {
	pandoc content/$1.md -o content/$1.html
	cat head.html content/$1.html foot.html > _site/$1.html
}

function update_refman () {
	git submodule init
	git submodule update
	wget https://raw.githubusercontent.com/embroidermodder/refman/main/emrm.pdf
	mv emrm.pdf downloads/emrm-current.pdf
}

function build_emscripten_version () {
	git submodule init
	git submodule update
	cd libembroidery
	emcc embroidery.c -o embroidery.wasm
	mv embroidery.wasm ../downloads
}

function build_website () {
	rm -fr _site
	mkdir -p _site
	cp -R data downloads commands images icons samples fonts favicon.png _site

	for file in index downloads about changelog credits documentation todo converter
	do
		make_page $file
	done
}

#update_refman
#build_emscripten_version
build_website

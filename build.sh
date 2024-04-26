#!/bin/bash
#
# Lighter weight style static site generator for the main pages.
#
# build_emscripten_version
#
# git clone https://github.com/embroidermodder/libembroidery
# cd libembroidery
# emcc embroidery.c -o embroidery.wasm
# mv embroidery.wasm ../downloads
# cd ..

rm -fr _site
mkdir -p _site
cp -R downloads commands images icons samples fonts favicon.png _site

for file in index downloads about changelog credits documentation todo converter
do
	pandoc content/$file.md -o content/$file.html
	cat head.html content/$file.html foot.html > _site/$file.html
done

for project in refman user-manual
do
	cd $project
		bash build.sh
	cd ..
	cp -r $project/site _site/$project
done


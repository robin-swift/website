#!/bin/bash

RES="`pwd`/docs/testing.md"

function fail_result () {
    echo -e '\n```\n' >> $RES
    echo "$1" >> $RES
    exit 0
}

date &>> $RES

rm -fr embroidermodder libembroidery

echo "## Embroidermodder Download" > $RES
git clone https://github.com/Embroidermodder/embroidermodder &>> $RES || fail_result 1
cd embroidermodder

echo "## Embroidermodder Build" >> $RES
echo -e '\n```\n' >> $RES
bash build.sh --linux &>> $RES || fail_result 2
echo -e '\n```\n' >> $RES

echo "## Embroidermodder Debug" >> $RES
echo -e '\n```\n' >> $RES
CURRENTLY DEACTIVATED
#bash build.sh -d &>> $RES || fail_result 3
echo -e '\n```\n' >> $RES

cd ..

git clone https://github.com/Embroidermodder/libembroidery &>> $RES || fail_result 4
cd libembroidery

echo "## Libembroidery Build" >> $RES
echo -e '\n```\n' >> $RES
cmake . &>> $RES || fail_result 5
make &>> $RES || fail_result 6
echo -e '\n```\n' >> $RES

echo "## Libembroidery Testing" >> $RES
echo -e '\n```\n' >> $RES
CURRENTLY DEACTIVATED
#./embroider --test &>> $RES || fail_result 7
echo -e '\n```\n' >> $RES

cd ../..

git clone https://github.com/Embroidermodder/EmbroideryMobile || fail_result 8
cd EmbroideryMobile

echo "## " >> $RES
echo -e '\n```\n' >> $RES
CURRENTLY DEACTIVATED
#bash build.sh -d &>> $RES || fail_result 9
echo -e '\n```\n' >> $RES

cd ..

echo "0" >> $RES

#!/bin/sh

RES="`pwd`/docs/testing.md"

function fail_result () {
    echo "$1" >> $RES
    exit 0
}

echo "## Embroidermodder Download" > $RES
git clone https://github.com/Embroidermodder/embroidermodder &>> $RES || fail_result 1
cd embroidermodder || fail_result 2

echo "## Embroidermodder Build" >> $RES
echo -e '\n```\n' >> $RES
bash build.sh --linux &>> $RES || fail_result 3
echo -e '\n```\n' >> $RES

echo "## Embroidermodder Debug" >> $RES
echo -e '\n```\n' >> $RES
bash build.sh -d &>> $RES || fail_result 4
echo -e '\n```\n' >> $RES

cd .. || fail_result 5

git clone https://github.com/Embroidermodder/libembroidery &>> $RES || fail_result 6
cd libembroidery || fail_result 7

echo "## Libembroidery Build" >> $RES
echo -e '\n```\n' >> $RES
bash build.sh -d &>> $RES || fail_result 8
echo -e '\n```\n' >> $RES

cd debug || fail_result 9

echo "## Libembroidery Testing" >> $RES
echo -e '\n```\n' >> $RES
./embroider --test &>> $RES || fail_result 10
echo -e '\n```\n' >> $RES

cd .. || fail_result 11
cd .. || fail_result 12

git clone https://github.com/Embroidermodder/EmbroideryMobile || fail_result 13
cd EmbroideryMobile || fail_result 14

echo "## " >> $RES
echo -e '\n```\n' >> $RES
bash build.sh -d &>> $RES || fail_result 15
echo -e '\n```\n' >> $RES

cd .. || fail_result 16

echo "0" >> $RES

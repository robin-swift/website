#!/bin/sh

mkdir test_report || exit 1
echo "0" > test_report/result.txt

function fail_result () {
    echo "$1" > test_report/result.txt
    exit 0
}

git clone https://github.com/Embroidermodder/embroidermodder || fail_result 1
cd embroidermodder || fail_result 2
bash build.sh --linux &> ../test_report/build_embroidermodder.log || fail_result 3
bash build.sh -d &> ../test_report/debug_embroidermodder.log || fail_result 4
cd .. || fail_result 5

git clone https://github.com/Embroidermodder/libembroidery || fail_result 6
cd libembroidery || fail_result 7
bash build.sh -d &> ../test_report/build_libembroidery.log || fail_result 8
cd debug || fail_result 9
./embroider --test &> ../test_report/test_embroider.log || fail_result 10
cd .. || fail_result 11
cd .. || fail_result 12

git clone https://github.com/Embroidermodder/EmbroideryMobile || fail_result 13
cd EmbroideryMobile || fail_result 14
bash build.sh -d &> ../test_report/build_mobile.log || fail_result 15
cd .. || fail_result 16

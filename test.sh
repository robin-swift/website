#!/bin/sh

mkdir test_report || exit 1

git clone https://github.com/Embroidermodder/embroidermodder || exit 1
cd embroidermodder || exit 1
bash build.sh --linux &> ../test_report/build_embroidermodder.log || exit 1
bash build.sh -d &> ../test_report/debug_embroidermodder.log || exit 1
cd .. || exit 1

git clone https://github.com/Embroidermodder/libembroidery || exit 1
cd libembroidery || exit 1
bash build.sh -d &> ../test_report/build_libembroidery.log || exit 1
cd debug || exit 1
./embroider --test &> ../test_report/test_embroider.log || exit 1
cd .. || exit 1
cd .. || exit 1

git clone https://github.com/Embroidermodder/EmbroideryMobile || exit 1
cd EmbroideryMobile || exit 1
# bash build.sh -d &> ../build_mobile.log || exit 1
cd .. || exit 1

# Copyright (c) 2021 ABLECLOUD Co. Ltd
# 이 파일은 ablestack ISO image를 생성하는 파일입니다.
# 최초 작성일 : 2021. 04. 27

#!/bin/bash

BUILD_PATH=$1
KS_PATH=$2
ORG_ISO_PATH=$3

mkdir -p $BUILD_PATH/ISO

/usr/bin/cp -r $KS_PATH/* $ORG_ISO_PATH/


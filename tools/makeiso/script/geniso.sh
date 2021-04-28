# Copyright (c) 2021 ABLECLOUD Co. Ltd
# 이 파일은 ablestack ISO image를 생성하는 파일입니다.
# 최초 작성일 : 2021. 04. 27

#!/bin/bash

VERSION=$1
BUILD_PATH=$2
ORG_ISO_PATH=$3

genisoimage -U -r -v -T -J -joliet-long -V "ABLESTACK" -volset "ABLESTACK" -A "ABLESTACK" -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e images/efiboot.img -no-emul-boot -o $BUILD_PATH/ISO/ABLESTACK-$VERSION-el8.iso $ORG_ISO_PATH


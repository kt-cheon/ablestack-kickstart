# Copyright (c) 2021 ABLECLOUD Co. Ltd
# 이 파일은 ablestack ISO image를 생성하는 파일입니다.
# 최초 작성일 : 2021. 03. 23

#!/bin/bash

PRODUCT_PATH=$1
ORG_ISO_PATH=$2

# product.img 파일 생성
find $PRODUCT_PATH | cpio -c -o | gzip -9cv > product.img
# product.img 파일 복사
\mv -f product.img $ORG_ISO_PATH/images/

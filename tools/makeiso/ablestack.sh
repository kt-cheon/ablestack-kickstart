# Copyright (c) 2021 ABLECLOUD Co. Ltd
# 이 파일은 ablestack ISO image를 생성하는 파일입니다.
# 최초 작성일 : 2021. 04. 27

#!/bin/bash

red=`tput setaf 1`;
blue=`tput setaf 4`;
green=`tput setaf 2`;
reset=`tput sgr0`;

VERSION=$1
ORG_ISO_PATH=$2
KS_PATH="/root/ablestack-ktcheon/ablestack-kickstart/kickstart/"
BUILD_PATH=`pwd -P`

if [ $# -ne 2 ]
then
    echo $red;
    echo -e "\nUsage: $0 [version] [ORGIN_ISO_PATH]"
    echo -e "Example: $0 Allo-v1.0.0 /opt/ablestack-iso/\n"
    echo $reset;
    exit
fi


echo $green;
echo "Generate iso image ABLESTACK" $1
echo $reset;

##### branding iso
sh $BUILD_PATH/script/branding.sh $BUILD_PATH/product/ $ORG_ISO_PATH > /dev/null 2>&1

PS3='Please enter your choice: '
options=("Full image" "Not included qcow2" "Exit build process")
select opt in "${options[@]}"
do
    case $opt in
        "Full image")
            sh $BUILD_PATH/script/presetup-full.sh $BUILD_PATH $KS_PATH $ORG_ISO_PATH
            echo $green;
            echo "Generate iso image 'ABLESTACK_$VERSION-el8.iso'"
            echo $reset;
            sh $BUILD_PATH/script/geniso.sh $VERSION $BUILD_PATH $ORG_ISO_PATH
            break
            ;;
        "Not included qcow2")
            sh $BUILD_PATH/script/presetup-noqcow2.sh $BUILD_PATH $KS_PATH $ORG_ISO_PATH
            echo $green;
            echo "Generate iso image 'ABLESTACK_$VERSION-noqcow2-el8.iso'"
            echo $reset;
            sh $BUILD_PATH/script/geniso.sh $VERSION $BUILD_PATH $ORG_ISO_PATH
            break
            ;;
        "Exit build process")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

#!/bin/bash
imgDir=`date +%s`
mkdir /home/`whoami`/Pictures/$imgDir
adb pull /storage/sdcard0/DCIM/Camera/ /home/`whoami`/Pictures/$imgDir

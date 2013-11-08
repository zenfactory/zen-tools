#!/bin/bash

###
# Make sure adb is installed
###
#sudo apt-get install android-tools-adb

###
# Define image locationes
###

# Where do you keep all your photos
imgRoot="/home/`whoami`/Pictures"

# A new directory based on the current unix epoch to store this image pull
imgDir=`date +%s`

# The path of the images on your android phone
cameraDir="/storage/sdcard0/DCIM/Camera/"

# Create the directory to store the images in
mkdir $imgRoot/$imgDir

# Pull images from android device to directory created above
sudo /home/hassan/bin/android-studio/sdk/platform-tools/adb pull $cameraDir $imgRoot/$imgDir

#!/usr/bin/env bash
#
# Script to convert video files.
# You need to say where the directory (s) file (s) is (are),
# which will be the reference output and inform the desired size in variables

# including a config file called by config.sh
# You need include a this file in your convert_videos path
source config.sh

# In your config.sh, include this data referring your necessity

#ORIGINAL_VIDEOS_DIR=/home/user/Videos
#OUTPUT_VIDEOS_DIR=/home/user/Desktop
#SIZE_VIDEOS="320:240"
#FORMAT_ORIGIN="rmvb"
#FORMAT_DESTIN="avi"

# =========================================================

# Changelog

# 0.2 Inserts a loop in a directory
# 0.1 Only inserts a command to convert videos

# =========================================================

# Creating list of files
LIST=$(ls ${ORIGINAL_VIDEOS_DIR} *.${FORMAT_ORIGIN})

# Running in directory converting all selected videos
for i in $LIST;
do
  mencoder -oac mp3lame -lameopts cbr:br=64:vol=2 -srate 22050 -ovc xvid -sws 1 -xvidencopts bitrate=384:max_key_interval=120:vhq=4 -ofps 30 -vf scale=$SIZE_VIDEOS $ORIGINAL_VIDEOS_DIR/$i -o $OUTPUT_VIDEOS_DIR/$i.$FORMAT_DESTIN
done

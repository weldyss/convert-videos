#!/usr/bin/env bash
#
# Script to convert files into mp4 rmvb.
# You need to say where the directory (s) file (s) is (are),
# which will be the reference output and inform the desired size in variables

# including a config file called by config.sh
# You need include a this file in your convert_videos path
source config.sh

# In your config.sh, include this data referring your necessity

#ORIGINAL_VIDEOS_DIR=/home/user/Videos
#OUTPUT_VIDEOS_DIR=/home/user/Desktop
#SIZE_VIDEOS="320:240"

mencoder -oac mp3lame -lameopts cbr:br=64:vol=2 -srate 22050 -ovc xvid -sws 1 -xvidencopts bitrate=384:max_key_interval=120:vhq=4 -ofps 30 -vf scale=320:240 ${ORIGINAL_VIDEOS_DIR} -o ${OUTPUT_VIDEOS_DIR}/samantha.mp4

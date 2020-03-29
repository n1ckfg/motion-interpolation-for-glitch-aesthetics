#! /bin/bash

# https://www.hellocatfood.com/motion-interpolation-for-glitch-aesthetics-using-ffmpeg-part-2/

INPUT_NAME=$1
OUTPUT_NAME="${INPUT_NAME%%.*}"

FPS=25

ME=fss
#ME=ds
#ME=hexbs
#ME=epzs

CMD="setpts=62.5*PTS,minterpolate='fps=$FPS:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=obmc:me_mode=bidir:me=$ME'"

ffmpeg -i $INPUT_NAME -filter:v $CMD "$OUTPUT_NAME"_glitch.mp4
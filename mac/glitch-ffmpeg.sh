#! /bin/bash

# https://www.hellocatfood.com/motion-interpolation-for-glitch-aesthetics-using-ffmpeg-part-0/

INPUT_NAME=$1
OUTPUT_NAME="${INPUT_NAME%%.*}"

FPS=25

MC_MODE=obmc
#MC_MODE=aobmc

ME_MODE=bidir
#ME_MODE=bilat

#ME=ds
#ME=epzs
#ME=esa
ME=fss
#ME=hexbs
#ME=ntss
#ME=tdls
#ME=tss
#ME=umh


CMD="setpts=62.5*PTS,minterpolate='fps=$FPS:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=$MC_MODE:me_mode=$ME_MODE:me=$ME'"

ffmpeg -i $INPUT_NAME -filter:v $CMD "$OUTPUT_NAME"_glitch.mp4
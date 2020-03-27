#! /bin/bash

# https://www.hellocatfood.com/motion-interpolation-for-glitch-aesthetics-using-ffmpeg-part-5/

INPUT_NAME=$1
OUTPUT_NAME="${INPUT_NAME%%.*}"

FPS=25

MC_MODE=aobmc
#MC_MODE=obmc

ME_MODE=bidir
#ME_MODE=bilat

ME=epzs
#ME=umh
#ME=esa
#ME=tss

CMD="setpts=62.5*PTS,minterpolate='fps=$FPS:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=$MC_MODE:me_mode=$ME_MODE:me=$ME'"

ffmpeg -i $INPUT_NAME -filter:v $CMD "$OUTPUT_NAME"_glitch.mp4
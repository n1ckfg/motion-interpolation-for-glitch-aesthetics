@echo off

ffmpeg -i cat_rainbow_original.mp4 -filter:v "setpts=62.5*PTS,minterpolate='fps=25:mb_size=16:search_param=400:vsbmc=0:scd=none:'" test.mp4

@pause
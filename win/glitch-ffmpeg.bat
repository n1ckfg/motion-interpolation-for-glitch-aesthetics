@echo off

set INPUT_NAME=%~1
set OUTPUT_NAME=%~dpn1

ffmpeg -i %INPUT_NAME% -filter:v "setpts=62.5*PTS,minterpolate='fps=25:mb_size=16:search_param=400:vsbmc=0:scd=none:'" %OUTPUT_NAME%_glitch.mp4

@pause
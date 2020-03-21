@echo off

rem https://www.hellocatfood.com/motion-interpolation-for-glitch-aesthetics-using-ffmpeg-part-2/

set INPUT_NAME=%~1
set OUTPUT_NAME=%~dpn1

set FPS=25

set MODE=fss
rem set MODE=ds
rem set MODE=hexbs
rem set MODE=epzs

set CMD="setpts=62.5*PTS,minterpolate='fps=%FPS%:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=obmc:me_mode=bidir:me=%MODE%'"

ffmpeg -i %INPUT_NAME% -filter:v %CMD% %OUTPUT_NAME%_glitch.mp4

@pause
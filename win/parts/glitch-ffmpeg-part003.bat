@echo off

rem https://www.hellocatfood.com/motion-interpolation-for-glitch-aesthetics-using-ffmpeg-part-3/

set INPUT_NAME=%~1
set OUTPUT_NAME=%~dpn1

set FPS=25

set MC_MODE=obmc
rem set MC_MODE=aobmc

set ME=umh
rem set ME=esa
rem set ME=tss
rem set ME=tdls

set CMD="setpts=62.5*PTS,minterpolate='fps=%FPS%:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=%MC_MODE%:me_mode=bidir:me=%ME%'"

ffmpeg -i %INPUT_NAME% -filter:v %CMD% %OUTPUT_NAME%_glitch.mp4

@pause
@echo off
echo "MAKE SURE YOU HAVE 2Gigs of ram free!"
echo "All files in input direcory will be encoded"

set /p BitRate= Enter wanted bitrate (5M, 2M, 8M, 1024k, ...):  
set /p Res= Enter wanted resolution (1920x1080, 800x600, ...): 
set /p FPS= Enter wanted framerate (30, 24, 60, ...):
set /p Duration= Enter wanted video length in secouds. Leave empty for whole thing (10, 15, 60, ...):
echo __________________________________________________

IF "%Res%"=="" SET Res=1920x1080
IF "%BitRate%"=="" SET BitRate=4M
IF "%FPS%"=="" SET FPS=30
IF NOT "%Duration%"=="" SET Duration=-t %Duration%

echo "Using BitRate %BitRate%"
echo "Using resolution %Res%"
echo "Using framerate %FPS%"
echo "Using video duration %Duration%"
pause
mkdir out


for /f %%f in ('dir /b input') do (

echo "Encodeing mp4 pass 1"
.\2ffmpeg -i input/%%f -codec:v libx264 -profile:v high -level:v 4.0 -b:v %BitRate% -refs 4 -movflags faststart -preset veryslow -framerate %FPS% %Duration% -s %Res% -pix_fmt yuv420p -crf 18 -threads 0 -pass 1 -g 30 -r %FPS% -f mp4 out\%%f.mp4-temp
echo "Encodeing mp4 pass 2"
.\2ffmpeg -i input/%%f -codec:v libx264 -profile:v high -level:v 4.0 -b:v %BitRate% -refs 4 -movflags faststart -preset veryslow -framerate %FPS% %Duration% -s %Res% -pix_fmt yuv420p -crf 18 -threads 0 -pass 2 -g 30 -r %FPS% -f mp4 out\%%f.mp4

)

echo "Done. Check out folder."
pause
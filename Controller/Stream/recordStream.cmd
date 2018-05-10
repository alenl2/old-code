x86_64\bin\gst-launch-1.0.exe -v -e udpsrc port=9000 caps="application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264" ! tee name=t t. ! queue ! rtpjitterbuffer ! rtph264depay ! h264parse ! matroskamux ! filesink location=test.mkv t. ! queue ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false

pause 
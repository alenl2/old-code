x86_64\bin\gst-launch-1.0.exe -v videotestsrc ! warptv ! videoconvert ! x264enc ! rtph264pay config-interval=10 pt=96 !  udpsink host=192.168.100.95 port=9000

pause
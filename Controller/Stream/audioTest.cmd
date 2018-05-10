x86_64\bin\gst-launch-1.0.exe -v -e autoaudiosrc ! audioconvert ! vorbisenc ! oggmux ! filesink location=dump.ogg


pause 
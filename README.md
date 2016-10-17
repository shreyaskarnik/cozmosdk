# cozmosdk
Dockerfile for (Cozmo SDK)[http://cozmosdk.anki.com/]

To Run:
`docker run -it --net=host -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY cozmo bash`

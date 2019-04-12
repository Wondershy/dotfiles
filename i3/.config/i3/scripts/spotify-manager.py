#!/usr/bin/python3
import sys
import os

dbus_cmd = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.{}"

actions = ["PlayPause", "Next", "Previous", "Stop"]

if len(sys.argv) > 1:
    if sys.argv[1] in actions:
        os.system(dbus_cmd.format(sys.argv[1]))
    else:
        print("Commands:")
        print(*[" - " + key for key in actions], sep='\n')


#!/usr/bin/python3
import sys
import os
from subprocess import check_output


def get_pid(name):
    try:
        return check_output(["pidof",name])
    except:
        return 0

app = { 1 : {"command":"firefox",       "process":"firefox"}, \
        2 : {"command":"thunderbird",   "process":"thunderbird"}, \
        4 : {"command":"discord",       "process":""}, \
        10 :{"command":"cantata",       "process":"cantata"} }

if len(sys.argv) > 1:
    if int(sys.argv[1]) in app:
        app = app[int(sys.argv[1])]
        if app["process"] == "" or get_pid(app["process"]) == 0: #if not already run
            os.system(app["command"])

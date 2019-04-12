#!/usr/bin/python3
import sys
import subprocess
import os
from subprocess import check_output
import yaml

def get_pid(name):
    try:
        return check_output(["pidof",name])
    except:
        return 0

app = { 1 : {"command":"vivaldi-snapshot",  "process": ["vivaldi-bin", "firefox"]}, \
        2 : {"command":"thunderbird",       "process": ["thunderbird"]}, \
        4 : {"command":"discord",           "process": ["Discord"]}, \
        10 :{"command":"spotify",           "process": ["spotify"]} 
     }

def process_run(listProcess):
    for process in listProcess:
        if get_pid(process) != 0:
            return True
    return False

def workspace_empty(workspace):
    command = "i3-msg -t get_tree"
    process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
    output, _ = process.communicate()
    data =  yaml.load(output)
    return data

    return [item for item in data if item["name"] == str(workspace)]

print(workspace_empty(1))

if len(sys.argv) > 1 and int(sys.argv[1]) in app:
        app = app[int(sys.argv[1])]
        if not process_run(app["process"]): #if not already run
            os.system(app["command"])

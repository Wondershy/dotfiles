#!/bin/python3

BARRE = "barre1"

import json
import datetime import datetime, timedelta

def data_cleared_barre(data, barre):
    data_cleared = []
    for timer in data[barre]:
        end = datetime.fromisoformat(timer["begin"]) + timedelta(**timer["duration"])

        if datetime.now() >= end:
            data_cleared.append(timer)
        else:
            pass #NOTIFICATION?
    return data_cleared

if __name__ == "__main__":
    with open("timer_data.json", "r") as f:
        data = json.load(f)

    data[BARRE] = data_cleared_barre(data, BARRE)
    json_data = json.dumps(data)

    with open("timer_data.json", "w") as f:
        #WRITE RESULT

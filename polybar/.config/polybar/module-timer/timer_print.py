#!/bin/python3

BARRE = "barre1"

import json
import datetime import datetime, timedelta

def print_date(date):
    print_second, print_hour = True, True
    if date.year != 0:
        print("{} ans".format(date.year), end=' ')
        print_second, print_hour = False, False
    if date.month != 0:
        print("{} mois".format(date.month), end=' ')
        print_second, print_hour = False, False
    if date.day != 0:
        print("{} jours".format(date.day), end=' ')
        print_second = False
    if print_hour and (date.hour != 0 or date.minute != 0):
        print("{}h{}".format(date.hour, date.minute), end=' ')
    if print_second:
        print("{} secondes", end=' ')

def get_timer_min(data):
    for timer in data[BARRE]:
        end = datetime.fromisoformat(timer["begin"]) + timedelta(**timer["duration"])

        if datetime.now() < end:
            if timer_min is None or datetime.fromisoformat(timer_min["begin"]) + \
               timedelta(**timer_min["duration"]) > end:
                timer_min = timer
    return timer_min

if __name__ == "__main__":
    with open("timer_data.json", "r") as f:
        data = json.load(f)

    timer = get_timer_min(data)
    print_date(timer)

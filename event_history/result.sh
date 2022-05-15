#!/bin/bash

awk '/serdar/&&/Terminate/' event_history.csv | grep -Eo "i-[a-zA-Z0-9]{17}"| sort -u > result.txt

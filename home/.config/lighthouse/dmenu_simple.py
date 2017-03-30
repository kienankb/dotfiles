#!/usr/bin/python

import sys
import subprocess

dmenuList = subprocess.check_output(['dmenu_path']).split('\n')

while 1:
	usrInput = sys.stdin.readline()[:-1]
	resultsString = "{ " + usrInput + " | " + usrInput + " }"
	for entry in dmenuList:
		if entry.startswith(usrInput):
			resultsString += "{ " + entry + " | " + entry + "}"
	print(resultsString)
	sys.stdout.flush()

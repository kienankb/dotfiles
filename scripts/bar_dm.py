import sys

while True:
	report = raw_input()
	report = report.split(':')
	statstring = u"%{c} "
	for entry in report:
		if (entry[0] == 'F'):
			statstring += u"%{F#ff7200}\u25cb "
		elif (entry[0] == 'f'):
			statstring += u"%{F-}\u25cb "
		elif (entry[0] == 'O'):
			statstring += u"%{F#ff7200}\u25cf "
		elif (entry[0] == 'o'):
			statstring += u"%{F-}\u25cf "
	print statstring.encode('utf-8')
	sys.stdout.flush()

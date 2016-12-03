import sys

if len(sys.argv) == 1:
	print("Usage: python bar_dm.py <active desktop color>")

while True:
	report = raw_input()
	report = report.split(':')
	statstring = u"%{c} "
	for entry in report:
		if (entry[0] == 'F'):
			statstring += u"%{F" + sys.argv[1] + u"}\u25cb "
		elif (entry[0] == 'f'):
			statstring += u"%{F-}\u25cb "
		elif (entry[0] == 'O'):
			statstring += u"%{F" + sys.argv[1] + u"}\u25cf "
		elif (entry[0] == 'o'):
			statstring += u"%{F-}\u25cf "
	print statstring.encode('utf-8')
	sys.stdout.flush()

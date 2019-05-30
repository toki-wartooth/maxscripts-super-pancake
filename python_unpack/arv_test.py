import sys

print "this is scriptname", sys.argv[0]
if len(sys.argv) > 1:
	for i in xrange(1, len(sys.argv)):
		print "this is arguments", sys.argv[i]
else:
	print"end"
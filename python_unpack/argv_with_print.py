import sys, os

print "this is scriptname", sys.argv[0]
if len(sys.argv) > 1:
	for i in xrange(1, len(sys.argv)):
		print "this is arguments", sys.argv[i]
else:
	print"end"

####
# os.path.normpath

scriptpath = os.getcwd()
f = os.path.normpath(scriptpath + "/out/data.txt")
fp = os.path.split(f)[0]
if os.path.exists(fp) is not True:
	os.makedirs(fp)


file_obj = open(f, "w")

for i in xrange(0, len(sys.argv)):
	file_obj.write(sys.argv[i] + "\n")


file_obj.close()




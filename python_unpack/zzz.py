t1 = [1,2,3,4,5,6,6,64,3,2,1]
print t1

for i in xrange(0, len(t1)):
	if t1[i]==3:
		t1.pop(i)
print t1



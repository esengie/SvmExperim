#!/usr/bin/python

k = 0
pluses = 0
minuses = 0
proportion = 80

for line in open('features.dat'):
    g= line
    k +=1
    if g[0:2] == '-1':
      minuses +=1
    else:
      pluses +=1

trainPl = pluses * proportion / 100

testPl = pluses - trainPl

trainMn = minuses * proportion / 100

testMn = minuses - trainMn


pses = 0
muses = 0
f1 = open('./train.dat', 'w+')
f2 = open('./test.dat', 'w+')

for line in open('features.dat'):
    g= line
    if g[0:2] == '-1':
      if muses < trainMn:
	f1.write(g)
      else:
	f2.write(g)
      muses +=1
    else:
      if pses < trainPl:
	f1.write(g)
      else:
	f2.write(g)
      pses +=1
  
  
f1.close()
f2.close()
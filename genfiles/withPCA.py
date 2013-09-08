#!/usr/bin/python
import mdp
import numpy as np
from operator import methodcaller

PC = mdp.nodes.PCANode(output_dim=0.95)

train = []

lab = []

for line in open('features.dat'):
    g = line.rstrip().split(" ")
    lab.append(int(g[0]))
    g = map (methodcaller('split', ':'), g[1:])
    g = map(lambda x: x[1:], g)
    g = [item for sublist in g for item in sublist]
    train.append(map(float, g))
train = np.array(train)

#PC.train(train)
train = PC.execute(train)

f3 = open('./trainPC.dat', 'w+')
PC.save('./model')

ghj=''
for i in range(len(lab)):
    ghj = str(lab[i])
    k = 1
    for j in train[i,]:
	ghj += ' ' + str(k) + ':' + str(j)
	k += 1
    ghj += '\r\n'
    f3.write(ghj)
    ghj='' 
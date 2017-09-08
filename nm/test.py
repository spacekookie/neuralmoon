#!/usr/bin/env python

import numpy as np

# input
x = np.array([[1, 0, 1, 0], [1, 0, 1, 1], [0, 1, 0, 1]])

# output
y = np.array([[1], [1], [0]])

# sigmoid
def sigmoid(x):
  return 1 / (1 + np.exp(-x))

# derivative of sigmoid
def der_sigmoid(x):
  return x * (1 - x)

# variable init
epoch = 1000
lr = 0.1
ilayer_neur = x.shape[1]  # Features in data set
hlayer_neur = 3           # Hidden layer neurons
o_neur = 1                # Output layer neurons

# weight and bias initialisation
wh = np.random.uniform(size = (ilayer_neur, hlayer_neur))
bh = np.random.uniform(size = (1, hlayer_neur))
wout = np.random.uniform(size = (hlayer_neur, o_neur))
bout = np.random.uniform(size = (1, o_neur))


output = 0

for i in range(epoch):

  # forward propagation
  hlayer_input_1 = np.dot(x, wh)
  hlayer_input = hlayer_input_1 + bh
  hlayer_activations = sigmoid(hlayer_input)
  olayer_input_1 = np.dot(hlayer_activations, wout)
  olayer_input = olayer_input_1 + bout
  output = sigmoid(olayer_input)

  # backwards propagation
  e = y - output
  slope_olayer = der_sigmoid(output)
  slope_hlayer = der_sigmoid(hlayer_activations)
  dout = e * slope_olayer
  e_hlayer = dout.dot(wout.T)
  d_hlayer = e_hlayer * slope_hlayer
  wout += hlayer_activations.T.dot(dout) * lr
  bout += np.sum(dout, axis = 0, keepdims = True) * lr
  wh += x.T.dot(d_hlayer) * lr
  bh += np.sum(d_hlayer, axis = 0, keepdims = True) * lr

# print(output[0])

# for i in range(100):
#   print(np.exp(i))

y = np.array([[1], [1], [0]])
print(y)
print(y.shape[0])
print(y.shape[1])
print(y.shape)
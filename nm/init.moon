#!/usr/bin/env luajit

m = require 'math'
nl = require 'numlua'
mat = nl.matrix

-- input
x = {
  {1, 0, 1, 0},
  {1, 0, 1, 1},
  {0, 1, 0, 1}
}

-- output
y = { { 1 }, { 1 }, { 0 } }

shape = (tbl) -> return { #tbl, #tbl[1] }
sigmoid = (x) -> return 1 / (1 + m.exp -x)
sigmoid_derived = (x) -> return x * (1 - x)

-- How many training iterations
epoch = 1000
lr = 0.1
ilayer_neur = shape x  -- Features in data set
hlayer_neur = 3        -- Hidden layer neurons
o_neur = 1             -- Output layer neurons

-- weight and bias initialisation
wh = m.random ilayer_neur, hlayer_neur
bh = m.random 1, hlayer_neur
wout = m.random hlayer_neur, o_neur
bout = m.random 1, o_neur

output = 0

-- for i = 0, epoch
  
  -- forward propagation
  -- hlayer_input_1 = np.dot(x, wh)
  -- hlayer_input = hlayer_input_1 + bh
  -- hlayer_activations = sigmoid(hlayer_input)
  -- olayer_input_1 = np.dot(hlayer_activations, wout)
  -- olayer_input = olayer_input_1 + bout
  -- output = sigmoid(olayer_input)
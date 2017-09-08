local m = require('math')
local nl = require('numlua')
local mat = nl.matrix
local x = {
  {
    1,
    0,
    1,
    0
  },
  {
    1,
    0,
    1,
    1
  },
  {
    0,
    1,
    0,
    1
  }
}
local y = {
  {
    1
  },
  {
    1
  },
  {
    0
  }
}
local shape
shape = function(tbl)
  return {
    #tbl,
    #tbl[1]
  }
end
local sigmoid
sigmoid = function(x)
  return 1 / (1 + m.exp(-x))
end
local sigmoid_derived
sigmoid_derived = function(x)
  return x * (1 - x)
end
local epoch = 1000
local lr = 0.1
local ilayer_neur = shape(x)
local hlayer_neur = 3
local o_neur = 1
local wh = m.random(ilayer_neur, hlayer_neur)
local bh = m.random(1, hlayer_neur)
local wout = m.random(hlayer_neur, o_neur)
local bout = m.random(1, o_neur)
local output = 0

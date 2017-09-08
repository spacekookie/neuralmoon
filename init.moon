-- Change package path
package.path = "?.lua;?/init.lua;" .. package.path
require 'luarocks.loader'

print "===================="
neural = require 'nm'
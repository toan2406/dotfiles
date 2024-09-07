local fn = vim.fn
local start_time = fn.reltime()

require('general/settings')
require('general/mappings')
require('config.spellcheck')
require('config.lazy')

print('Loaded in ' .. fn.printf('%.3f', fn.reltimefloat(fn.reltime(start_time))) .. ' seconds.')

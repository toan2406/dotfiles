local g = vim.g
local fn = vim.fn
local start_time = fn.reltime()

require('general/settings')
require('general/mappings')

require('config.lazy')

require('config/sneak')
require('config/leap')
require('config/kommentary')
require('config/copilot')
require('config/llm')
require('config/navigator')
require('config/autopairs')
require('config/fugitive')
require('config/colorizer')
require('config/gitsigns')
require('config/spotify')
-- require('config/neorg')
-- require('config/orgmode')
-- require('config/obsidian')
require('config/marks')
require('config/dap')
require('config/spellcheck')
require('config/zk')
require('config/dadbod')
require('config/spider')
-- require('config/tree')
-- require('config/symbols')

print('Loaded in ' .. fn.printf('%.3f', fn.reltimefloat(fn.reltime(start_time))) .. ' seconds.')

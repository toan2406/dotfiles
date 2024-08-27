local fn = vim.fn
local start_time = fn.reltime()

require('general/settings')
require('general/mappings')

require('config.lazy')

require('config/copilot')
require('config/llm')
require('config/navigator')
require('config/spotify')
-- require('config/neorg')
-- require('config/orgmode')
-- require('config/obsidian')
require('config/dap')
require('config/spellcheck')
require('config/zk')
require('config/dadbod')
require('config/spider')

print('Loaded in ' .. fn.printf('%.3f', fn.reltimefloat(fn.reltime(start_time))) .. ' seconds.')

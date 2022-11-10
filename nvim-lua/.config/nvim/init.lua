local g = vim.g
local fn = vim.fn
local start_time = fn.reltime()

require('general/settings')
require('general/mappings')

require('colorschemes/gruvbox')

require('plugins')
require('plugins/vifm')
require('plugins/fzf')
require('plugins/sneak')
require('plugins/leap')
require('plugins/kommentary')
require('plugins/cmp')
require('plugins/navigator')
require('plugins/autopairs')
require('plugins/lualine')
require('plugins/fugitive')
require('plugins/treesitter')
require('plugins/lsp')
require('plugins/blankline')
require('plugins/colorizer')
require('plugins/gitsigns')
require('plugins/spotify')
-- require('plugins/neorg')
-- require('plugins/orgmode')
require('plugins/obsidian')
require('plugins/marks')
require('plugins/dap')
require('plugins/spellcheck')
require('plugins/whichkey')
require('plugins/diffview')
-- require('plugins/tree')
-- require('plugins/symbols')

print('Loaded in ' .. fn.printf('%.3f', fn.reltimefloat(fn.reltime(start_time))) .. ' seconds.')


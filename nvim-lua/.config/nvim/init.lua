vim.g.start_time = vim.fn.reltime()

require('general/settings')
require('general/mappings')

require('colorschemes/tender')

require('plugins')
require('plugins/vifm')
require('plugins/sneak')
require('plugins/hop')
require('plugins/kommentary')
require('plugins/fzf')
require('plugins/compe')
require('plugins/navigator')
require('plugins/autopairs')
require('plugins/lightline')
require('plugins/ale')
require('plugins/fugitive')
require('plugins/treesitter')
require('plugins/lsp')
require('plugins/blankline')
require('plugins/colorizer')
-- require('plugins/symbols')
require('plugins/spotify')
require('plugins/dashboard')


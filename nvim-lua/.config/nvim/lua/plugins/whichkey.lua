local wk = require('which-key')

vim.o.timeoutlen = 500

wk.setup({
  window = {
    border = 'none',
    position = 'bottom',
    margin = {1,0,1,0},
    padding = {0,0,0,0},
    winblend = 0,
  },
  ignore_missing = true,
})

wk.register({
  f = {
    name = 'find',
    f = {'Find Files'},
    g = {'Live Grep'},
    b = {'Find Buffers'},
    w = {'Grep Word'},
    c = {'Find Commands'},
    m = {'Find Marks'},
    p = {'Find Projects'},
  }
}, {prefix = '<leader>'})


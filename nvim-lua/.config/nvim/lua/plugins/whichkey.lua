local wk = require('which-key')

vim.o.timeoutlen = 500

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  window = {
    border = 'none',
    position = 'bottom',
    margin = {1,0,1,0},
    padding = {0,0,0,0},
    winblend = 0,
  },
  ignore_missing = false,
})

wk.register({
  f = {
    name = 'find',
    f = {'Find Files'},
    g = {'Live Grep'},
    b = {'Find Buffers'},
    w = {'Grep Word'},
    h = {'Find Help Tags'},
    ['/'] = {'Search History'},
    [':'] = {'Command History'},
    c = {'Find Commands'},
    m = {'Find Marks'},
    t = {'Find Git Changed Files'},
    a = {'Find Normal Mappings'},
    p = {'Find Projects'},
  },
  p = {'Find Files'},
  s = {'Live Grep'},
  b = {'Find Buffers'},
  w = {'Grep Word'},
}, {prefix = '<leader>'})


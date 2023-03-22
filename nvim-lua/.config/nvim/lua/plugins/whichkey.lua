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
  gf = 'which_key_ignore',
  [','] = 'which_key_ignore',
  g = {
    name = 'git',
    g = {'Open Status Window'},
    v = {'Open Commit Browser'},
    l = {'List Previous Revisions'},
    o = {'Open On Github'},
  },
  z = {
    name = 'note',
    f = {'Open Notes'},
    s = {'Search Notes'},
    t = {'Open Notes By Tag'},
    n = {'New Note'},
  },
  l = {
    name = 'language',
    d = {'Go To Definition'},
    v = {'Go To Definition In Split'},
    f = {'Format'},
    h = {'Hover'},
  },
  h = {
    name = 'Harpoon',
  },
  d = {
    name = 'debug',
  },
}, {prefix = '<leader>'})


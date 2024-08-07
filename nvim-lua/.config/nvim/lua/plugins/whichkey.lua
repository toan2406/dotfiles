local wk = require('which-key')

wk.setup({
  preset = 'classic',
  delay = function(ctx)
    return 200
  end,
  filter = function(mapping)
    return mapping.desc and mapping.desc ~= ''
    -- return true
  end,
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
  win = {
    border = 'none',
    padding = {0, 1},
    wo = {
      winblend = 0,
    },
  },
  icons = {
    mappings = false,
    colors = false,
  },
})

wk.add({
  {'<leader>p', desc = 'Find Files'},
  {'<leader>s', desc = 'Live Grep'},
  {'<leader>b', desc = 'Find Buffers'},
  {'<leader>w', desc = 'Grep Word'},

  {'<leader>f', group = 'find'},
  {'<leader>ff', desc = 'Find Files'},
  {'<leader>fg', desc = 'Live Grep'},
  {'<leader>fb', desc = 'Find Buffers'},
  {'<leader>fw', desc = 'Grep Word'},
  {'<leader>fh', desc = 'Find Help Tags'},
  {'<leader>f/', desc = 'Search History'},
  {'<leader>f:', desc = 'Command History'},
  {'<leader>fc', desc = 'Find Commands'},
  {'<leader>fm', desc = 'Find Marks'},
  {'<leader>ft', desc = 'Find Git Changed Files'},
  {'<leader>fa', desc = 'Find Normal Mappings'},
  {'<leader>fp', desc = 'Find Projects'},

  {'<leader>g', group = 'git'},
  {'<leader>gg', desc = 'Open Status Window'},
  {'<leader>gv', desc = 'Open Commit Browser'},
  {'<leader>gl', desc = 'List Previous Revisions'},
  {'<leader>go', desc = 'Open On Github'},
  {'<leader>gh', desc = 'Open File History'},

  {'<leader>l', group = 'language'},
  {'<leader>ld', desc = 'Go To Definition'},
  {'<leader>lv', desc = 'Go To Definition In Split'},
  {'<leader>lf', desc = 'Format'},
  {'<leader>lh', desc = 'Hover'},

  {'<leader>z', group = 'note'},
  {'<leader>zf', desc = 'Open Notes'},
  {'<leader>zs', desc = 'Search Notes'},
  {'<leader>zt', desc = 'Open Notes By Tag'},
  {'<leader>zn', desc = 'New Note'},

  {'<leader>d', group = 'debug'},
})


local g = vim.g
local fn = vim.fn

g.dashboard_default_executive = 'fzf'

g.dashboard_custom_header = {
  "                            ",
  "                            ",
  "                            ",
  "        .          .        ",
  "      ';;,.        ::'      ",
  "    ,:::;,,'       :ccc,    ",
  "   ,::c::,,,,.     :cccc,   ",
  "   ,cccc:;;;;;.    cllll,   ",
  "   ,cccc;.;;;;;,   cllll;   ",
  "   ;cccc; .;;;;;;. coooo;   ",
  "   ;llll;   ,:::::'loooo;   ",
  "   ;llll:    ':::::loooo:   ",
  "   :oooo:     .::::llodd:   ",
  "   .;ooo:       ;cclooo:.   ",
  "     .;oc        'coo;.     ",
  "       .'         .,.       ",
  "                            ",
  "                            ",
  "                            ",
}

g.dashboard_custom_section = {
  a = {
    description = {' Find file                             , f f'},
    command = 'Files'
  },
  b = {
    description = {' Find word                             , f g'},
    command = 'Rg'
  },
  c = {
    description = {' Browse files                          , e  '},
    command = 'Vifm'
  },
  d = {
    description = {' Open Nvim configuration               , v c'},
    command = ':e ~/.config/nvim/init.lua'
  }
}

g.dashboard_custom_footer = {
  'Nvim loaded in ' .. fn.printf('%.3f', fn.reltimefloat(fn.reltime(g.start_time))) .. ' seconds.'
}

g.dashboard_disable_statusline = 1

vim.cmd [[autocmd BufEnter * set laststatus=2]]


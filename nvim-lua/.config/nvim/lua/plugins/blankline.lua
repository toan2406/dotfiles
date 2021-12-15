vim.cmd [[highlight IndentOdd guifg=NONE guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentEven guifg=NONE guibg=#323232 gui=nocombine]]

require('indent_blankline').setup({
  char = '',
  char_highlight_list = {
    'IndentOdd',
    'IndentEven'
  },
  space_char_highlight_list = {
    'IndentOdd',
    'IndentEven'
  },
  show_trailing_blankline_indent = false,
  filetype_exclude = {
    'dashboard'
  },
  enabled = false,
})


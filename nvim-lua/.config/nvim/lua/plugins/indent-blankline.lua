vim.cmd [[autocmd ColorScheme * highlight IndentOdd guifg=NONE guibg=NONE gui=nocombine]]
vim.cmd [[autocmd ColorScheme * highlight IndentEven guifg=NONE guibg=#333a40 gui=nocombine]]

vim.g.indent_blankline_char_highlight_list = {'IndentOdd', 'IndentEven'}
vim.g.indent_blankline_space_char_highlight_list = {'IndentOdd', 'IndentEven'}

vim.g.indent_blankline_char = ' '
vim.g.indent_blankline_space_char = ' '

vim.g.indent_blankline_show_trailing_blankline_indent = false

vim.g.indent_blankline_enabled = false


require('gruvbox').setup({
  bold = false,
  italic = {
    strings = false,
    operators = false,
    comments = true,
  },
  invert_selection = false,
  contrast = '',
})

vim.cmd [[colorscheme gruvbox]]


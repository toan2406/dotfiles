require('ibl').setup({
  enabled = false,
  debounce = 200,
  indent = {
    highlight = {'CursorColumn', 'Whitespace'},
    char = '',
  },
  whitespace = {
    highlight = {'CursorColumn', 'Whitespace'},
    remove_blankline_trail = false,
  },
  scope = {
    enabled = false,
  },
})


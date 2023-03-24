require('diffview').setup({
  enhanced_diff_hl = true,
  use_icons = false,
})

vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory %<CR>')


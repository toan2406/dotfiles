require('gen').setup({
  model = 'mistral',
  display_mode = 'split',
  show_prompt = true,
  show_model = true,
  no_auto_close = true,
})

vim.keymap.set({'n', 'v'}, '<leader>oo', ':Gen<CR>')
vim.keymap.set('n', '<leader>oc', ':Gen Chat<CR>')


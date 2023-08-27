local spider = require('spider')

spider.setup({
  skipInsignificantPunctuation = true
})

vim.keymap.set({'n', 'o', 'x'}, 'w', "<CMD>lua require('spider').motion('w')<CR>", {desc = 'Spider-w'})
vim.keymap.set({'n', 'o', 'x'}, 'e', "<CMD>lua require('spider').motion('e')<CR>", {desc = 'Spider-e'})
vim.keymap.set({'n', 'o', 'x'}, 'b', "<CMD>lua require('spider').motion('b')<CR>", {desc = 'Spider-b'})
vim.keymap.set({'n', 'o', 'x'}, 'ge', "<CMD>lua require('spider').motion('ge')<CR>", {desc = 'Spider-ge'})


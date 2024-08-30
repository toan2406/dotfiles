if require('zk.util').notebook_root(vim.fn.expand('%:p')) ~= nil then
  local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end

  local opts = { noremap = true, silent = false }

  map('n', '<CR>', ":lua vim.lsp.buf.definition()<CR>", opts)
  map('n', 'K', ":lua vim.lsp.buf.hover()<CR>", opts)

  map('n', '<leader>zb', ":ZkBacklinks<CR>", opts)
  map('n', '<leader>zl', ":ZkLinks<CR>", opts)
  map('n', '<leader>zi', ":ZkInsertLink<CR>", opts)
  map('v', '<leader>zi', ":'<,'>ZkLinkSelection<CR>", opts)
end

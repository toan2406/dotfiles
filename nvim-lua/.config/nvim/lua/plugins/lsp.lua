local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', '<leader>ld', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lD', '<CMD>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>lh', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
end

-- npm install -g typescript typescript-language-server
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  handlers = {['textDocument/publishDiagnostics'] = function(...) end}
})


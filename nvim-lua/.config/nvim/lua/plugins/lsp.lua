local nvim_lsp = require('lspconfig')
local saga = require('lspsaga')
local api = vim.api

saga.init_lsp_saga()

api.nvim_set_keymap('n', '<leader>lh', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<C-b>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {noremap = true, silent = true})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)

  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end
end

-- npm install -g typescript typescript-language-server
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  flags = {debounce_text_changes = 150},
  -- handlers = {['textDocument/publishDiagnostics'] = function(...) end}
})

-- curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
-- unzip elixir-ls.zip -d /usr/local/bin/elixir-ls
-- chmod +x /usr/local/bin/elixir-ls/language_server.sh
nvim_lsp.elixirls.setup({
  cmd = {'/usr/local/bin/elixir-ls/language_server.sh'},
  settings = {
    ['elixirLS.dialyzerEnabled'] = true,
    ['elixirLS.dialyzerFormat'] = 'dialyzer',
    ['elixirLS.dialyzerWarnOpts'] = {},
    ['elixirLS.fetchDeps'] = true,
    ['elixirLS.mixEnv'] = 'test',
    ['elixirLS.suggestSpecs'] = true,
  },

  on_attach = on_attach,
  flags = {debounce_text_changes = 150}
})

-- npm install -g ocaml-language-server
-- opam switch create 4.06.0
-- eval $(opam env)
-- opam install reason merlin
nvim_lsp.ocamlls.setup({
  on_attach = on_attach,
  flags = {debounce_text_changes = 150}
})

nvim_lsp.rescriptls.setup({
  cmd = {
    'node',
    '/Users/toannguyen/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js',
    '--stdio'
  },

  on_attach = on_attach,
  flags = {debounce_text_changes = 150}
})

-- gem install solargraph
nvim_lsp.solargraph.setup({
  on_attach = on_attach,
  flags = {debounce_text_changes = 150}
})

-- brew install efm-langserver
nvim_lsp.efm.setup({
  init_options = {documentFormatting = true, codeAction = true},
  filetypes = {'javascript', 'javascriptreact', 'typescript', 'ruby', 'json'},
  settings = {
    languages = {
      json = {
        {
          formatCommand = 'prettier --stdin-filepath ${INPUT}',
          formatStdin = true,
        }
      }
    }
  },

  on_attach = on_attach,
  flags = {debounce_text_changes = 150}
})


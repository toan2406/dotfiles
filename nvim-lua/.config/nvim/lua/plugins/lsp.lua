local lspconfig = require('lspconfig')
local saga = require('lspsaga')
local api = vim.api

vim.lsp.handlers['textDocument/publishDiagnostics'] = function(...)
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      underline = true,
      update_in_insert = false,
    }
  )(...)

  if vim.lsp.buf.server_ready() then
    pcall(vim.diagnostic.setloclist, {open = false})
  end
end

saga.init_lsp_saga()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>ll', '<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  buf_set_keymap('n', '<leader>lh', ':Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
  buf_set_keymap('n', '<C-b>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

  if client.name == 'solargraph' or client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150},
})

-- curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
-- unzip elixir-ls.zip -d /usr/local/bin/elixir-ls
-- chmod +x /usr/local/bin/elixir-ls/language_server.sh
lspconfig.elixirls.setup({
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
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- npm install -g ocaml-language-server
-- opam switch create 4.06.0
-- eval $(opam env)
-- opam install reason merlin
lspconfig.ocamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

lspconfig.rescriptls.setup({
  cmd = {
    'node',
    '/Users/toannguyen/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js',
    '--stdio'
  },

  on_attach = on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- gem install solargraph
lspconfig.solargraph.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

local prettier = {
  formatCommand = 'prettier --stdin-filepath ${INPUT}',
  formatStdin = true,
}

local eslint = {
  lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %trror %m'},
}

local rubocop = {
  lintCommand = 'rubocop --format emacs --force-exclusion --stdin ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f:%l:%c: %t: %m'},
  formatCommand = 'rubocop --auto-correct --force-exclusion --stdin ${INPUT} 2>/dev/null | sed "1,/^====================$/d"',
  formatStdin = true,
}

-- brew install efm-langserver
-- npm install -g eslint_d
lspconfig.efm.setup({
  root_dir = lspconfig.util.root_pattern('.git', 'package.json'),
  init_options = {documentFormatting = true, codeAction = true},
  filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'ruby', 'json'},
  settings = {
    languages = {
      javascript = {prettier, eslint},
      javascriptreact = {prettier, eslint},
      typescript = {prettier, eslint},
      typescriptreact = {prettier, eslint},
      ruby = {rubocop},
      json = {prettier},
    }
  },

  on_attach = on_attach,
  flags = {debounce_text_changes = 150}
})


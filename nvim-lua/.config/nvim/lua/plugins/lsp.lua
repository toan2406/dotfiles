local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local saga = require('lspsaga')
local navic = require('nvim-navic')

lsp_status.register_progress()
lsp_status.config({
  indicator_errors = 'E',
  indicator_warnings = 'W',
  indicator_info = 'i',
  indicator_hint = '?',
  indicator_ok = 'Ok',
})

saga.setup({
  lightbulb = {
    enable = false
  },
  symbol_in_winbar = {
    enable = false
  },
  ui = {
    -- Gruvbox dark
    colors = {
      normal_bg = '#32302f',
      title_bg = '#32302f',
      fg = '#ebdbb2',
      red = '#cc241d',
      magenta = '#b16286',
      yellow = '#d79921',
      green = '#98971a',
      cyan = '#689d6a',
      blue = '#458588',
      white = '#a89984',
      black = '#282828',
    },
  },
})

navic.setup({
  icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = "ƒ ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = " ",
    Interface = " ",
    Function = "ƒ ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = " ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = " ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  }
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = function(...)
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      underline = true,
      update_in_insert = false,
    }
  )(...)

  if vim.lsp.buf.server_ready() and vim.api.nvim_get_mode().mode ~= 'i' then
    -- If the current win is a loclist, get its associated win
    -- Ref: https://neovim.io/doc/user/builtin.html#getloclist()
    local filewinid = vim.fn.getloclist(0, {filewinid = 0})['filewinid']
    local winnr = filewinid ~= 0 and filewinid or 0;

    pcall(vim.diagnostic.setloclist, {open = false, winnr = winnr})
  end
end

-- vim.api.nvim_create_augroup('diagnostics', {clear = true})
-- vim.api.nvim_create_autocmd('DiagnosticChanged', {
--   group = 'diagnostics',
--   callback = function()
--     if vim.api.nvim_get_mode().mode ~= 'i' then
--       vim.diagnostic.setloclist({open = false})
--     end
--   end,
-- })

local signs = {Error = 'E ', Warn = 'W ', Hint = '? ', Info = 'i '}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local common_on_attach = function(client, bufnr)
  lsp_status.on_attach(client)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.format({async = true})<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lv', '<CMD>vsplit | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', '<CMD>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>ll', '<CMD>lua vim.diagnostic.setloclist()<CR>', opts)

  buf_set_keymap('n', '<leader>lh', ':Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<leader>ln', ':Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>lo', ':Lspsaga outline<CR>', opts)
  buf_set_keymap('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
  buf_set_keymap('n', '<C-b>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    navic.attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
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

  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- npm install -g ocaml-language-server
-- opam switch create 4.06.0
-- eval $(opam env)
-- opam install reason merlin
lspconfig.ocamlls.setup({
  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

lspconfig.rescriptls.setup({
  cmd = {
    'node',
    '/Users/toannguyen/.local/share/nvim/lazy/vim-rescript/server/out/server.js',
    '--stdio'
  },

  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- gem install solargraph
lspconfig.solargraph.setup({
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.definitionProvider = false
  end,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup({
  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- brew install rust-analyzer
lspconfig.rust_analyzer.setup({
  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- vim.cmd [[
--   autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require('lsp_extensions').inlay_hints({})
-- ]]

-- brew install lua-language-server
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim', 'hs', 'spoon'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    }
  },

  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- brew install llvm
lspconfig.clangd.setup({
  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

-- brew install ltex-ls
lspconfig.ltex.setup({
  cmd = {'ltex-ls'},
  filetypes = {'markdown'},
  root_dir = lspconfig.util.find_git_ancestor,
  settings = {
    ltex = {
      enabled = {'markdown'},
      checkFrequency = 'save',
      language = 'en-US',
      diagnosticSeverity = 'information',
      setenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = 'en-US',
      },
      dictionary = {},
      disabledRules = {
        ['en-US'] = {
          'EN_QUOTES',
          'UPPERCASE_SENTENCE_START',
        },
      },
      hiddenFalsePositives = {},
    },
  },

  on_attach = common_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 150}
})

lspconfig.zls.setup({
  on_attach = common_on_attach,
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

local pandoc = {
  formatCommand = 'pandoc -f gfm -t gfm -sp --tab-stop=2 --wrap=none',
  formatStdin = true,
}

local pgformatter = {
  formatCommand = 'pg_format',
  formatStdin = true,
}

-- brew install efm-langserver
-- npm install -g eslint_d
lspconfig.efm.setup({
  root_dir = lspconfig.util.root_pattern('.git', 'package.json'),
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'ruby', 'json', 'markdown', 'sql'},
  settings = {
    languages = {
      javascript = {prettier, eslint},
      javascriptreact = {prettier, eslint},
      typescript = {prettier, eslint},
      typescriptreact = {prettier, eslint},
      ruby = {rubocop},
      json = {prettier},
      markdown = {pandoc},
      sql = {pgformatter},
    }
  },

  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
    client.server_capabilities.definitionProvider = false
  end,
  flags = {debounce_text_changes = 150}
})


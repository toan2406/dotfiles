local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = 'https://github.com/nvim-neorg/tree-sitter-norg',
    files = {'src/parser.c', 'src/scanner.cc'},
    branch = 'main'
  }
}

parser_configs.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    files = {'src/parser.c', 'src/scanner.cc'},
    revision = 'main'
  },
  filetype = 'org'
}

require('nvim-treesitter.configs').setup({
  ensure_installed = {'javascript', 'ruby', 'lua', 'bash', 'go', 'json', 'typescript', 'norg', 'org', 'cpp'},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'grr',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definitions = 'gnD',
        list_definitions_toc = 'gO',
      },
    },
  },
})

vim.o.foldenable = false
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'


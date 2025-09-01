return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  event = 'VeryLazy',
  cmd = {
    'TSUpdateSync',
    'TSUpdate',
    'TSInstall',
    'TSUninstall',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'javascript',
        'ruby',
        'lua',
        'bash',
        'go',
        'json',
        'typescript',
        'cpp',
        'rust',
        'c',
        'markdown',
        'markdown_inline',
        'zig',
        'python',
        'yaml',
        'rescript',
        'prisma',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
      },
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
      refactor = {
        smart_rename = {
          enable = false,
          keymaps = {
            smart_rename = 'grr',
          },
        },
        navigation = {
          enable = false,
          keymaps = {
            goto_definition = 'gnd',
            list_definitions = 'gnD',
            list_definitions_toc = 'gO',
          },
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
      },
    })

    vim.o.foldenable = false
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
  end,
}

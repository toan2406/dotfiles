return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    dependencies = {},
    build = ':TSUpdate',
    event = 'VeryLazy',
    cmd = {
      'TSUpdateSync',
      'TSUpdate',
      'TSInstall',
      'TSUninstall',
    },
    config = function()
      require('nvim-treesitter').install({
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
      })

      vim.o.foldenable = false
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    init = function()
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = {
          lookahead = true,
          selection_modes = {
            ['@function.outer'] = 'v',
            ['@function.inner'] = 'v',
          },
          include_surrounding_whitespace = false,
        },
      })

      vim.keymap.set({ 'x', 'o' }, 'af', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'x', 'o' }, 'if', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
      end)
    end,
  },
}

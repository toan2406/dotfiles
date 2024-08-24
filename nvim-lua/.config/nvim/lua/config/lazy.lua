local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('plugins.diffview'),

  -- Color schemes
  'jacoborus/tender.vim',
  'ellisonleao/gruvbox.nvim',

  -- Navigation
  'toan2406/vifm.vim',
  'justinmk/vim-sneak',
  'ggandor/leap.nvim',
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
  'junegunn/fzf.vim',
  'kyazdani42/nvim-tree.lua',
  -- 'tpope/vim-projectionist',

  -- Completion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  -- Issue: https://github.com/hrsh7th/nvim-cmp/issues/1606
  { 'hrsh7th/nvim-cmp', commit = '950d0e3a93ba61c13b031c086d11eacf4bd48d24' },
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',

  -- Statusline
  { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true } },

  -- Git support
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'junegunn/gv.vim',
  'stsewd/fzf-checkout.vim',
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Language support
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', event = 'BufRead' },
  { 'nvim-treesitter/nvim-treesitter-refactor', event = 'BufRead' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufRead' },
  'neovim/nvim-lspconfig',
  'nvim-lua/lsp-status.nvim',
  'nvim-lua/lsp_extensions.nvim',
  { 'glepnir/lspsaga.nvim', branch = 'main' },
  { 'reasonml-editor/vim-reason-plus', ft = { 're', 'rei' } },
  { 'rescript-lang/vim-rescript', ft = { 'res', 'resi' } },
  'tpope/vim-rails',
  { 'elixir-editors/vim-elixir', ft = { 'ex', 'exs' } },
  { 'SmiteshP/nvim-navic', dependencies = { 'neovim/nvim-lspconfig' } },
  'mickael-menu/zk-nvim',

  -- Database
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',

  -- Debug
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },

  -- Terminal
  'numtostr/FTerm.nvim',

  -- Misc
  'windwp/nvim-autopairs',
  'tpope/vim-surround',
  'norcalli/nvim-colorizer.lua',
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    event = 'BufRead',
    config = function()
      require('ibl').setup({
        enabled = false,
        debounce = 200,
        indent = {
          highlight = { 'CursorColumn', 'Whitespace' },
          char = '',
        },
        whitespace = {
          highlight = { 'CursorColumn', 'Whitespace' },
          remove_blankline_trail = false,
        },
        scope = {
          enabled = false,
        },
      })
    end
  },
  'b3nj5m1n/kommentary',
  'numToStr/Navigator.nvim',
  'simrat39/symbols-outline.nvim',
  -- 'tversteeg/registers.nvim',
  'chentoast/marks.nvim',
  { 'folke/which-key.nvim', event = 'VeryLazy' },
  { 'ellisonleao/glow.nvim', branch = 'main' },
  { 'ThePrimeagen/harpoon', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'chrisgrieser/nvim-spider', lazy = true },
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require('duck').hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require('duck').cook() end, {})
    end
  },

  -- Org mode
  { 'nvim-neorg/neorg', ft = 'norg', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-orgmode/orgmode', ft = 'org' },

  -- Copilot
  { 'zbirenbaum/copilot.lua', cmd = 'Copilot', event = 'InsertEnter' },
  { 'zbirenbaum/copilot-cmp', dependencies = { 'zbirenbaum/copilot.lua' } },
  { 'David-Kunz/gen.nvim' },

  -- Local plugins
  { dir = '~/.dotfiles/nvim-plugins/list-toggle.nvim', config = function() require('list-toggle') end },
  { dir = '~/.dotfiles/nvim-plugins/debug-helper.nvim' },
  { dir = '~/.dotfiles/nvim-plugins/obsidian.nvim' },
}, {
  defaults = {
    lazy = false,
  },
})

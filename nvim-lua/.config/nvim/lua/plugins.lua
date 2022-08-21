return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color schemes
  use 'jacoborus/tender.vim'
  use 'ellisonleao/gruvbox.nvim'

  -- Navigation
  use 'toan2406/vifm.vim'
  use 'justinmk/vim-sneak'
  use {'phaazon/hop.nvim', as = 'hop'}
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use 'junegunn/fzf.vim'
  use 'kyazdani42/nvim-tree.lua'
  -- use 'tpope/vim-projectionist'

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    commit = '5f68f070e4f7158517afc55f125a6f5ed1f7db47'
  }

  -- Git support
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use 'stsewd/fzf-checkout.vim'
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Language support
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'tami5/lspsaga.nvim'
  use 'reasonml-editor/vim-reason-plus'
  use 'rescript-lang/vim-rescript'
  use 'tpope/vim-rails'
  use 'elixir-editors/vim-elixir'
  use {'SmiteshP/nvim-gps', requires = {'nvim-treesitter/nvim-treesitter'}}

  -- Debug
  use 'mfussenegger/nvim-dap'
  use {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'}}

  -- Terminal
  use 'numtostr/FTerm.nvim'

  -- Misc
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'b3nj5m1n/kommentary'
  use 'numToStr/Navigator.nvim'
  use 'simrat39/symbols-outline.nvim'
  -- use 'tversteeg/registers.nvim'
  use 'chentoast/marks.nvim'
  use 'folke/which-key.nvim'
  use {'ellisonleao/glow.nvim', branch = 'main'}

  -- Org mode
  use {'nvim-neorg/neorg', requires = {'nvim-lua/plenary.nvim'}}
  use 'nvim-orgmode/orgmode'

  -- Copilot
  -- use 'github/copilot.vim'

  -- Local plugins
  use {'~/.dotfiles/nvim-plugins/list-toggle.nvim', config = function() require('list-toggle') end}
  use '~/.dotfiles/nvim-plugins/debug-helper.nvim'
  use '~/.dotfiles/nvim-plugins/obsidian.nvim'
end)


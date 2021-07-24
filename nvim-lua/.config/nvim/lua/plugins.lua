return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color schemes
  use 'jacoborus/tender.vim'
  use 'andreypopp/vim-colors-plain'
  use 'folke/tokyonight.nvim'
  use 'projekt0n/github-nvim-theme'

  -- Navigation
  use 'toan2406/vifm.vim'
  use 'justinmk/vim-sneak'
  use {'phaazon/hop.nvim', as = 'hop'}
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use 'junegunn/fzf.vim'
  use 'tpope/vim-projectionist'

  -- Completion
  use 'hrsh7th/nvim-compe'

  -- Statusline
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  -- Git support
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use 'airblade/vim-gitgutter'

  -- Language support
  use 'dense-analysis/ale'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'reasonml-editor/vim-reason-plus'
  use 'rescript-lang/vim-rescript'

  -- Misc
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'b3nj5m1n/kommentary'
  use 'numToStr/Navigator.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'glepnir/dashboard-nvim'
end)


return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'jacoborus/tender.vim'
  use 'toan2406/vifm.vim'
  use 'justinmk/vim-sneak'
  use 'b3nj5m1n/kommentary'
  use 'hrsh7th/nvim-compe'
  use 'numToStr/Navigator.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'dense-analysis/ale'
  use 'lukas-reineke/indent-blankline.nvim'

  use 'itchyny/lightline.vim'
  use 'maximbaz/lightline-ale'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'

  use {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end
  }
  use 'junegunn/fzf.vim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'

  use 'neovim/nvim-lspconfig'

  use 'reasonml-editor/vim-reason-plus'
end)


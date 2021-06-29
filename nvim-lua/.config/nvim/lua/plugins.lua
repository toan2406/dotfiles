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
  use 'tpope/vim-fugitive'
  use 'dense-analysis/ale'
  use 'itchyny/lightline.vim'
  use 'maximbaz/lightline-ale'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use 'reasonml-editor/vim-reason-plus'
end)


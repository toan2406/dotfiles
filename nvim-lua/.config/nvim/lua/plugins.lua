return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'jacoborus/tender.vim'
  use 'toan2406/vifm.vim'
  use 'justinmk/vim-sneak'
  use 'b3nj5m1n/kommentary'
  use 'hrsh7th/nvim-compe'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
end)


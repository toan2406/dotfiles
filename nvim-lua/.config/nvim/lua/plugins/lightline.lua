vim.g.lightline = {
  colorscheme = 'tender',
  component_function = {
    gitbranch = 'fugitive#head',
  },
  component_expand = {
    linter_checking = 'lightline#ale#checking',
    linter_infos = 'lightline#ale#infos',
    linter_warnings = 'lightline#ale#warnings',
    linter_errors = 'lightline#ale#errors',
    linter_ok = 'lightline#ale#ok',
  },
  component_type = {
    linter_checking = 'right',
    linter_infos = 'right',
    linter_warnings = 'warning',
    linter_errors = 'error',
    linter_ok = 'right',
  },
  active = {
    left = {
      {'mode', 'paste'},
      {'gitbranch', 'readonly', 'filename', 'filetype', 'modified'},
    },
    right = {
      {'lineinfo'},
      {'percent'},
      {'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'},
    }
  }
}


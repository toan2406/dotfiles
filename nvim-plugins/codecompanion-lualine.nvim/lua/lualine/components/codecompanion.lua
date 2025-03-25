local M = require('lualine.component'):extend()

M.processing = false
M.spinner_index = 1

local spinner_symbols = {
  '.  ',
  '.. ',
  '...',
  '   ',
}
local spinner_symbols_len = 4

function M:init(options)
  M.super.init(self, options)

  local group = vim.api.nvim_create_augroup('CodeCompanionHooks', {})

  vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = 'CodeCompanionRequest*',
    group = group,
    callback = function(request)
      self.processing = (request.match ~= 'CodeCompanionRequestFinished')
    end,
  })
end

function M:update_status()
  if self.processing then
    self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
    return spinner_symbols[self.spinner_index]
  else
    return nil
  end
end

return M

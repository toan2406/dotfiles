local dap = require('dap')

local M = {}

M.step_over = function(opts)
  if dap.session() then
    dap.step_over()
  else
    vim.api.nvim_feedkeys(opts.fallback, 'n', true)
  end
end

M.step_into = function(opts)
  if dap.session() then
    dap.step_into()
  else
    vim.api.nvim_feedkeys(opts.fallback, 'n', true)
  end
end

M.step_out = function(opts)
  if dap.session() then
    dap.step_out()
  else
    vim.api.nvim_feedkeys(opts.fallback, 'n', true)
  end
end

M.status = function()
  if dap.session() then
    return 'DEBUGGING'
  else
    return ''
  end
end

return M

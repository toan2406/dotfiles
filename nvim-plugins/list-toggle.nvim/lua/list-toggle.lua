local M = {}

M.toggle_loclist = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.loclist == 1 then
      vim.cmd('lclose')
      return
    end
  end
  vim.cmd('lopen')
end

M.toggle_quickfix = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
end

return M

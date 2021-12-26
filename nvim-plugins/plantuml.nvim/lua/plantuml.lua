local M = {}
local ns = vim.api.nvim_create_namespace('plantuml')

local uml = [[
                      ┌─┐
                      ║"│
                      └┬┘
                      ┌┼┐
     ┌───┐             │
     │Bob│            ┌┴┐
     └─┬─┘           Alice
       │    hello      │
       │──────────────>│
       │               │
       │  Is it ok?    │
       │<─ ─ ─ ─ ─ ─ ─ │
     ┌─┴─┐           Alice
     │Bob│            ┌─┐
     └───┘            ║"│
                      └┬┘
                      ┌┼┐
                       │
                      ┌┴┐
]]

local function lines(str)
  local result = {}
  for line in str:gmatch('([^\n]*)\n?') do
    table.insert(result, {{line, 'plantumlok'}})
  end
  return result
end

M.test = function()
  local pos = vim.api.nvim_win_get_cursor(0)
  local id = vim.api.nvim_buf_set_extmark(0, ns, pos[1] - 1, 0, {
    end_line = pos[1] - 1,
    virt_lines = lines(uml)
  })
end

return M

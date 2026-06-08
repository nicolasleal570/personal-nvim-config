-- Incremental selection using Neovim's built-in treesitter API.
-- No external plugins required.
--
-- Flow:
--   <leader>v (normal)  -> select current treesitter node
--   <CR>      (visual)  -> expand selection to parent node
--   <BS>      (visual)  -> shrink selection to previous (child) node

local M = {}

local selection_stack = {}

local function get_node_at_cursor()
  local ok, node = pcall(vim.treesitter.get_node)
  if not ok or not node then return nil end
  return node
end

local function set_visual_selection(node)
  local srow, scol, erow, ecol = node:range()
  if erow == srow and ecol == scol then return end
  vim.api.nvim_win_set_cursor(0, { srow + 1, scol })
  vim.cmd 'normal! v'
  if ecol == 0 then
    vim.api.nvim_win_set_cursor(0, { erow, 0 })
    vim.cmd 'normal! $'
  else
    vim.api.nvim_win_set_cursor(0, { erow + 1, math.max(0, ecol - 1) })
  end
end

function M.init_selection()
  local node = get_node_at_cursor()
  if not node then
    vim.notify('No treesitter node here', vim.log.levels.WARN)
    return
  end
  selection_stack = { node }
  set_visual_selection(node)
end

function M.expand_selection()
  local current = selection_stack[#selection_stack]
  if not current then
    M.init_selection()
    return
  end
  local parent = current:parent()
  if not parent then return end
  table.insert(selection_stack, parent)
  set_visual_selection(parent)
end

function M.shrink_selection()
  if #selection_stack <= 1 then return end
  table.remove(selection_stack)
  set_visual_selection(selection_stack[#selection_stack])
end

vim.keymap.set('n', '<leader>v', M.init_selection, { desc = 'Visual select node (treesitter)' })
vim.keymap.set('x', '<CR>', M.expand_selection, { desc = 'Expand selection to parent node' })
vim.keymap.set('x', '<BS>', M.shrink_selection, { desc = 'Shrink selection to child node' })

return M

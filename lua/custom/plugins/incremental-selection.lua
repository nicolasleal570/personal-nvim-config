-- Incremental selection using Neovim's built-in treesitter API.
-- No external plugins required.
--
-- Flow:
--   <leader>v (normal)  -> select current treesitter node
--   <CR>      (visual)  -> expand selection to parent node
--   <BS>      (visual)  -> shrink selection to child node

local M = {}

local selection_stack = {}

local function get_node_at_cursor()
  local ok, node = pcall(vim.treesitter.get_node)
  if not ok or not node then return nil end
  return node
end

-- Apply a node's range as the current visual selection.
-- Order matters: exit any current visual mode FIRST (so its closing doesn't
-- overwrite our marks), then set the marks, then re-enter visual with `gv`.
local function set_visual_selection(node)
  local srow, scol, erow, ecol = node:range()
  if erow == srow and ecol == scol then return end

  local start_line = srow + 1
  local start_col = scol + 1
  local end_line, end_col
  if ecol == 0 then
    end_line = erow
    end_col = math.max(1, vim.fn.col { erow, '$' } - 1)
  else
    end_line = erow + 1
    end_col = ecol
  end

  local mode = vim.fn.mode()
  if mode == 'v' or mode == 'V' or mode == '\22' then
    local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
    vim.api.nvim_feedkeys(esc, 'nx', false)
  end

  vim.fn.setpos("'<", { 0, start_line, start_col, 0 })
  vim.fn.setpos("'>", { 0, end_line, end_col, 0 })
  vim.cmd 'normal! gv'
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

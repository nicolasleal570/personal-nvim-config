vim.pack.add { 'https://github.com/alexghergh/nvim-tmux-navigation' }

local nav = require 'nvim-tmux-navigation'

nav.setup {
  disable_when_zoomed = true,
  keybindings = {
    left = '<C-h>',
    down = '<C-j>',
    up = '<C-k>',
    right = '<C-l>',
    last_active = '<C-\\>',
  },
}

vim.keymap.set('n', '<C-h>', nav.NvimTmuxNavigateLeft, { desc = 'Navigate left (tmux/nvim)' })
vim.keymap.set('n', '<C-j>', nav.NvimTmuxNavigateDown, { desc = 'Navigate down (tmux/nvim)' })
vim.keymap.set('n', '<C-k>', nav.NvimTmuxNavigateUp, { desc = 'Navigate up (tmux/nvim)' })
vim.keymap.set('n', '<C-l>', nav.NvimTmuxNavigateRight, { desc = 'Navigate right (tmux/nvim)' })
vim.keymap.set('n', '<C-\\>', nav.NvimTmuxNavigateLastActive, { desc = 'Navigate to last active pane' })

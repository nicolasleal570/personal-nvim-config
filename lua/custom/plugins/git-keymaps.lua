-- Git keymaps using Telescope (already installed).
-- Equivalent to VSCode's "Source Control" panel and more.

local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus (changed files)' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits (repo history)' })
vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = '[G]it [C]ommits for current buffer' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches (switch/create)' })
vim.keymap.set('n', '<leader>gS', builtin.git_stash, { desc = '[G]it [S]tash list' })

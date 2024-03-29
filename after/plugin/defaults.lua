-- Set relative number
vim.opt.relativenumber = true

-- Set scrollof
vim.o.scrolloff = 10


-- Keymaps for saving and quit from a a file
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- Keymaps for navigate through split screens
-- vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Keymaps for navigate through tabs
vim.keymap.set('n', '<leader>h', ':tabprevious<CR>')
vim.keymap.set('n', '<leader>l', ':tabnext<CR>')

-- Keymaps for create split screens
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>')

-- Keymaps for create a new tab
vim.keymap.set('n', '<leader>t', ':tabnew .<CR>')

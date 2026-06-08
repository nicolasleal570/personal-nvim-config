vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
  },
  float = {
    padding = 2,
    max_width = 100,
    max_height = 0,
    border = 'rounded',
    win_options = {
      winblend = 0,
    },
  },
  keymaps = {
    ['g?'] = 'actions.show_help',
    ['<CR>'] = 'actions.select',
    ['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open in vertical split' },
    ['<C-x>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open in horizontal split' },
    ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open in new tab' },
    ['<C-p>'] = 'actions.preview',
    ['<C-c>'] = 'actions.close',
    ['<C-r>'] = 'actions.refresh',
    ['-'] = 'actions.parent',
    ['_'] = 'actions.open_cwd',
    ['`'] = 'actions.cd',
    ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' },
    ['gs'] = 'actions.change_sort',
    ['gx'] = 'actions.open_external',
    ['g.'] = 'actions.toggle_hidden',
    ['g\\'] = 'actions.toggle_trash',
    -- Disable C-h/j/k/l so tmux-navigation works inside oil buffers
    ['<C-h>'] = false,
    ['<C-j>'] = false,
    ['<C-k>'] = false,
    ['<C-l>'] = false,
  },
}

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory (Oil)' })
vim.keymap.set('n', '<leader>-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory (Oil floating)' })

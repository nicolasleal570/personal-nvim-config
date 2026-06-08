-- Focus mode: zen-mode + twilight.
-- <leader>z toggles zen-mode, which auto-activates twilight (dimming surrounding code).

vim.pack.add {
  'https://github.com/folke/twilight.nvim',
  'https://github.com/folke/zen-mode.nvim',
}

require('twilight').setup {
  dimming = {
    alpha = 0.25,
    inactive = false,
  },
  context = 10,
  treesitter = true,
  expand = {
    'function',
    'method',
    'table',
    'if_statement',
  },
  exclude = {},
}

require('zen-mode').setup {
  window = {
    backdrop = 0.95,
    width = 120,
    height = 1,
    options = {
      number = true,
      relativenumber = true,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = '0',
      list = false,
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
      laststatus = 0,
    },
    twilight = { enabled = true },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
  },
}

vim.keymap.set('n', '<leader>z', '<CMD>ZenMode<CR>', { desc = 'Toggle [Z]en mode (focus)' })
vim.keymap.set('n', '<leader>tw', '<CMD>Twilight<CR>', { desc = 'Toggle [T]wilight (dim only)' })

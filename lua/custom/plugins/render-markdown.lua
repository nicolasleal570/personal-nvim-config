vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  file_types = { 'markdown' },
  completions = { blink = { enabled = true } },
  heading = {
    sign = true,
    position = 'overlay',
    icons = { '󰫎 ', '󰫎 ', '󰫎 ', '󰫎 ', '󰫎 ', '󰫎 ' },
  },
  code = {
    sign = true,
    width = 'block',
    right_pad = 1,
  },
  checkbox = {
    enabled = true,
    position = 'overlay',
  },
  -- Show raw markdown on the cursor line so you can edit comfortably,
  -- and rendered text on every other line.
  anti_conceal = { enabled = true },
}

vim.keymap.set('n', '<leader>rm', '<CMD>RenderMarkdown toggle<CR>', { desc = 'Toggle render-markdown' })

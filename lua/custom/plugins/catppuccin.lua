vim.pack.add { 'https://github.com/catppuccin/nvim' }

require('catppuccin').setup {
  flavour = 'mocha',
  background = {
    light = 'latte',
    dark = 'mocha',
  },
  transparent_background = false,
  show_end_of_buffer = false,
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = false,
  no_underline = false,
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    blink_cmp = true,
    gitsigns = true,
    mason = true,
    mini = { enabled = true, indentscope_color = '' },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
    render_markdown = true,
    telescope = { enabled = true },
    treesitter = true,
    treesitter_context = true,
    which_key = true,
  },
}

vim.cmd.colorscheme 'catppuccin-mocha'

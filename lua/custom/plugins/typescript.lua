-- TypeScript / JavaScript IDE setup
-- Extends conform.nvim with prettierd for JS/TS family files, and enables format-on-save for them.
-- Relies on ts_ls and eslint LSPs being configured in init.lua and installed via Mason.

local conform = require 'conform'

local web_filetypes = {
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'vue',
  'svelte',
  'json',
  'jsonc',
  'css',
  'scss',
  'less',
  'html',
  'markdown',
  'yaml',
  'graphql',
}

for _, ft in ipairs(web_filetypes) do
  conform.formatters_by_ft[ft] = { 'prettierd', 'prettier', stop_after_first = true }
end

local format_group = vim.api.nvim_create_augroup('CustomFormatOnSave', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = format_group,
  pattern = {
    '*.js',
    '*.jsx',
    '*.ts',
    '*.tsx',
    '*.vue',
    '*.svelte',
    '*.json',
    '*.jsonc',
    '*.css',
    '*.scss',
    '*.less',
    '*.html',
    '*.md',
    '*.yml',
    '*.yaml',
    '*.graphql',
    '*.gql',
  },
  callback = function(args)
    conform.format { bufnr = args.buf, timeout_ms = 1000, lsp_format = 'fallback' }
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = format_group,
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.vue', '*.svelte' },
  callback = function()
    pcall(vim.cmd, 'silent! EslintFixAll')
  end,
})

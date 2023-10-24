return {
  "jose-elias-alvarez/null-ls.nvim",
  "MunifTanjim/prettier.nvim",
  config = function()
    local status, null_ls = pcall(require, "null-ls")

    if (not status) then return end

    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.prettierd,
      }
    }

    require("prettier").setup {
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
    }

    vim.keymap.set('n', '<leader>p', ':Prettier<CR>', { desc = 'Format document using prettier' })
  end,
}

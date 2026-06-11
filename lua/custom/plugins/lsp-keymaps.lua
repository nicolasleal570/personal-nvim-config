-- Classic VSCode-style LSP shortcuts (single-char prefix).
-- Coexists with Neovim's modern `gr*` defaults (grd, grr, grn, gra, gri).

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efinition (LSP)' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]o to [D]eclaration (LSP)' })

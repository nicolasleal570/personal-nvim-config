-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = false,
      window = {
        position = "left",
      },
      filesystem = {
        follow_current_file = true,
      },
      event_handlers = {
        -- Auto close when open a file
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end
        },

      }
    }

    -- Keymap for open and close file explorer
    vim.keymap.set('n', '<leader>nt', ':Neotree toggle<CR>', { desc = 'Toggle file explorer' })
  end,
}

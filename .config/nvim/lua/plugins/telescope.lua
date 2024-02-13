return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set( 'n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}

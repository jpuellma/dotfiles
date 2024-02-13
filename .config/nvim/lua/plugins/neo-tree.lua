return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-\\>", ":Neotree float reveal toggle<CR>")
    vim.keymap.set("n", "<leader>\\", ":Neotree float reveal toggle<CR>")
    vim.keymap.set("n", "<leader>b", ":Neotree float toggle buffers<cr>")
    vim.keymap.set("n", "<leader>[", ":Neotree left reveal toggle<CR>")
    vim.keymap.set("n", "<leader>]", ":Neotree right reveal toggle<CR>")

    -- Icons for diagnostic errors
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        position = "float",
        buffers = {
          group_empty_dirs = true,
        },
        filesystem = {
          -- hijack_netrw_behavior = "disabled",
          group_empty_dirs = true,
          window = {
            position = "float",
          },
          follow_current_file = {
            enabled = true,
          },
        },
      },
    })
  end,
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree").setup({
          filesystem = {
            hijack_netrw_behavior = "open_current",
          },
        })
      end
    end
  end,
}

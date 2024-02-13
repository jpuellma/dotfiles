return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        require("null-ls").builtins.formatting.stylua.with({
          condition = function(utils)
            return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
          end,
        }),
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.terraform_validate,
        null_ls.builtins.diagnostics.tfsec,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.black.with({
          extra_args = { "--line-length=100" },
        }),
        null_ls.builtins.formatting.hclfmt,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "--indent", "2" },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.terraform_fmt,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

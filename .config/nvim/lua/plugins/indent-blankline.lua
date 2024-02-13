return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    -- No frills.
    require("ibl").setup()

    --[[
    -- Background color indents.
    local highlight = {
      "CursorColumn",
      "Whitespace",
    }
    require("ibl").setup({
      indent = { highlight = highlight, char = "" },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    })
    --]]

    -- -- Rainbows
    -- local hooks = require("ibl.hooks")
    -- -- create the highlight groups in the highlight setup hook, so they are reset
    -- -- every time the colorscheme changes
    -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#6889D0" })
    --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6B8B4D" })
    --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#5C5CAC" })
    --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    -- end)
    -- local highlight = {
    --   "RainbowBlue",
    --   "RainbowGreen",
    --   "RainbowViolet",
    --   -- "RainbowCyan",
    --   -- "RainbowOrange",
    --   -- "RainbowRed",
    --   -- "RainbowYellow",
    -- }
    -- require("ibl").setup({ indent = { highlight = highlight } })
  end,
}

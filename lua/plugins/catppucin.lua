return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true, -- Native transparency
        integrations = {
          treesitter = true,
        },
        custom_highlights = function(colors)
          return {
            -- Overriding backgrounds to ensure total transparency
            Normal = { bg = "NONE" },
            NormalFloat = { bg = "NONE" },
            SignColumn = { bg = "NONE" },
            EndOfBuffer = { bg = "NONE" },
            -- Your existing custom highlights
            LineNr = { fg = colors.overlay1 },
            CursorLineNr = { fg = colors.lavender },
            CursorLine = { bg = "NONE" },
            FoldColumn = { bg = "NONE" },
          }
        end,
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}

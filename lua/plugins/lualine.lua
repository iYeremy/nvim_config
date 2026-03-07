-- =============================================================================
-- LUALINE CONFIGURATION
-- Description: Statusline configuration with Catppuccin theme and LSP integration.
-- =============================================================================

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin", -- Matches your main colorscheme
        component_separators = { left = "|", right = "|" },
        section_separators = { left = " ", right = " " }, -- Clean, flat look
        globalstatus = true, -- Single statusline for all windows
        disabled_filetypes = { statusline = { "dashboard", "alpha", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = " " }, right_padding = 2 } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

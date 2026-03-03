-- =============================================================================
-- MASON (Package Manager)
-- Description: Easily install and manage LSP servers, DAP servers, linters, and formatters.
-- =============================================================================

return {
  "williamboman/mason.nvim",
  cmd = "Mason", -- Lazy load when the command is called
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason UI" } },
  build = ":MasonUpdate",
  opts = {
    ui = {
      border = "rounded", -- Matches your Snacks aesthetic
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
  end,
}

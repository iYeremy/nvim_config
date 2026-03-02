-- =============================================================================
-- AUTOPAIRS CONFIGURATION
-- Description: Simple and automated closing of brackets and quotes.
-- =============================================================================

return {
  "windwp/nvim-autopairs",
  -- Load only when starting to type
  event = "InsertEnter",
  opts = {
    check_ts = true, -- Use Treesitter to avoid closing pairs in comments/strings
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {},  -- Keep it empty if you don't use the Alt-e shortcut
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- Integration with completion engine (Example: Blink or nvim-cmp)
    -- This ensures that when you confirm a function completion, 
    -- autopairs handles the parenthesis correctly.
  end,
}

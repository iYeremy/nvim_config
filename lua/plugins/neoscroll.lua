-- =============================================================================
-- SMOOTH SCROLLING (neoscroll.nvim)
-- Description: Adds butter-smooth scrolling to Neovim for better navigation.
-- =============================================================================

return {
  "karb94/neoscroll.nvim",
  -- Performance: Only load when we actually start scrolling
  keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  opts = {
    -- Time in milliseconds to complete the scroll
    duration_multiplier = 1.0, 
    -- Easing function: "quadratic", "cubic", "quartic", "quintic", "circular" or "sine"
    easing = "quadratic",      
    -- Stop at the end of the file
    stop_eof = true,           
    -- Hide cursor during scroll
    hide_cursor = true,        
  },
  config = function(_, opts)
    require("neoscroll").setup(opts)
  end,
}

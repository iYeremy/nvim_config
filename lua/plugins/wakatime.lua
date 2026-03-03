-- =============================================================================
-- WAKATIME (Coding Metrics)
-- Description: Automatic time tracking for your coding activity.
-- Note: Requires wakatime-cli and an API key in ~/.wakatime.cfg
-- =============================================================================

return {
  "wakatime/vim-wakatime",
  lazy = false, -- Must be loaded immediately to track startup time
  -- The plugin is mostly self-contained, but we can manage its behavior
  -- via global variables if needed in the future.
  init = function()
    -- Ensure the plugin starts tracking as soon as Neovim opens
    vim.g.wakatime_PythonBinary = "/usr/bin/python3" -- Optimization for Arch Linux
  end,
}

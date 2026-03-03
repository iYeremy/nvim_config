-- =============================================================================
-- SNACKS.NVIM 
-- Description: Modern Dashboard, Picker, Zen Mode and Explorer configuration.
-- Note: Explorer uses Folke's nested layout fix for Sixel/UI stability.
-- =============================================================================

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- -------------------------------------------------------------------------
    -- Zen Mode (Focus optimization without backdrop)
    -- -------------------------------------------------------------------------
    zen = {
      center = false,
      win = {
        backdrop = false, -- Keeps terminal transparency intact
        width = 0,
      },
      show = {
        statusline = false,
        tabline = false,
      },
    },

    -- -------------------------------------------------------------------------
    -- Explorer & Picker (Right-Side Layout)
    -- -------------------------------------------------------------------------
    picker = {
      enabled = true,
      sources = {
        explorer = {
          -- Official fix for positioning the explorer in Snacks.nvim
          layout = {
            layout = {
              position = "right", -- Anchored to the right to stabilize main buffer
              width = 30,
            },
          },
        },
      },
    },

    -- -------------------------------------------------------------------------
    -- Enabled Modules & UI Utilities
    -- -------------------------------------------------------------------------
    explorer  = { enabled = true, replace_netrw = true },
    dashboard = { 
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    indent    = { enabled = true }, -- Subtle indentation guides
    input     = { enabled = true }, -- Modern floating input for renames/prompts
    scope     = { enabled = true }, -- Highlight current code scope
    bigfile   = { enabled = true }, -- Performance optimization for large files
    words     = { enabled = true }, -- Auto-highlight words under cursor
  },

  -- ---------------------------------------------------------------------------
  -- Keybindings (Optimized for Leader access)
  -- ---------------------------------------------------------------------------
  keys = {
    -- File Management
    { "<leader>e",       function() Snacks.explorer() end,       desc = "File Explorer (Right)" }, 
    
    -- Pickers (Search)
    { "<leader><space>", function() Snacks.picker.smart() end,   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,    desc = "Grep Search" },
    
    -- Focus & Dashboard
    { "<leader>z",       function() Snacks.zen() end,            desc = "Toggle Zen Mode" },
    { "<leader>Z",       function() Snacks.zen.zoom() end,       desc = "Toggle Zoom" },
    { "<leader>bd",      function() Snacks.dashboard.open() end, desc = "Open Dashboard" },
  }
}

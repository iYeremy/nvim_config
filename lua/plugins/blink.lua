-- =============================================================================
-- COMPLETION ENGINE (blink.cmp)
-- Description: Modern, high-performance autocompletion engine written in Rust.
-- =============================================================================

return {
  "saghen/blink.cmp",
  -- Load snippets as a dependency
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- -------------------------------------------------------------------------
    -- Keymap Configuration
    -- Uses 'super-tab' preset: Tab to accept/next, Shift-Tab for previous.
    -- -------------------------------------------------------------------------
    keymap = { preset = "super-tab" },

    -- -------------------------------------------------------------------------
    -- UI & Appearance
    -- -------------------------------------------------------------------------
    appearance = {
      -- Use 'mono' for Nerd Font Mono or 'normal' for standard Nerd Font
      nerd_font_variant = "mono",
    },

    -- -------------------------------------------------------------------------
    -- Completion Behavior
    -- -------------------------------------------------------------------------
    completion = {
      -- Show documentation window automatically when an item is selected
      documentation = { auto_show = true, window = { border = "rounded" } },
      -- Improved menu visuals
      menu = { border = "rounded" },
    },

    -- -------------------------------------------------------------------------
    -- Sources & Engine
    -- -------------------------------------------------------------------------
    sources = {
      -- Default providers for completion
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- Use the Rust-based fuzzy matcher for superior performance and typo resistance
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  
  -- Allows extending the sources list from other files without overwriting
  opts_extend = { "sources.default" },
}

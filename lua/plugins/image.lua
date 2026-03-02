-- =============================================================================
-- IMAGE RENDERING (image.nvim)
-- Description: Sixel support for Foot terminal.
-- TODO: Improve compatibility with Snacks.explorer (Sixel ghosting).
-- =============================================================================

return {
  "3rd/image.nvim",
  event = "VeryLazy",
  opts = {
    backend = "sixel", -- Protocol for Foot terminal
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true, -- Clears image while typing to avoid artifacts
        download_remote_images = true,
        only_render_image_at_cursor = true, -- Helps with performance and ghosting
        filetypes = { "markdown", "vimwiki" },
      },
    },
    max_width = 80,
    max_height = 12,
    window_overlap_clear_enabled = false, -- Disabled to avoid flickering with Sixel
    editor_only_render_when_focused = true,
  },
}

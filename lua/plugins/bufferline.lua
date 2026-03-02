-- =============================================================================
-- BUFFERLINE CONFIGURATION
-- Description: Modern tab-bar for managing open buffers.
-- =============================================================================
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        -- Aesthetics
        separator_style = "thin",
        show_buffer_close_icons = false,
        show_close_icon = false,
        
        -- Icons & UI
        -- We disable icons here if you prefer a text-only minimalist look
        show_buffer_icons = true, 
        persist_buffer_sort = true,
        
        -- Diagnostics integration
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- Ensure it plays nice with potential future file explorers
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })
  end,
}

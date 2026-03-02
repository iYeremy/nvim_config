-- =============================================================================
-- IMAGE RENDERING (image.nvim)
-- Description: Surgical Sixel management for Foot + Snacks Explorer.
-- =============================================================================

return {
  "3rd/image.nvim",
  event = "VeryLazy",
  opts = {
    backend = "sixel",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        download_remote_images = true,
        -- Renderizar SOLO en el cursor es vital para no saturar Sixel
        only_render_image_at_cursor = true,
        filetypes = { "markdown", "vimwiki" },
      },
    },
    max_width = 80,
    max_height = 12,
    -- Desactivamos la limpieza global de solapamiento porque es muy agresiva
    window_overlap_clear_enabled = false, 
    editor_only_render_when_focused = true,
  },
  config = function(_, opts)
    local image = require("image")
    image.setup(opts)

    -- Crear un grupo para no duplicar autocomandos
    local group = vim.api.nvim_create_augroup("ImageSixelFix", { clear = true })

    -- 1. CUANDO ENTRAS AL EXPLORER: Limpia todo para que no haya duplicados
    vim.api.nvim_create_autocmd("WinEnter", {
      group = group,
      callback = function()
        if vim.bo.filetype == "snacks_explorer" then
          image.clear()
          vim.cmd("redraw") -- Limpieza suave
        end
      end,
    })

    -- 2. CUANDO VUELVES AL MARKDOWN: Forzar que la imagen aparezca
    -- Usamos un pequeño delay (50ms) para que el Explorer termine de moverse
    vim.api.nvim_create_autocmd("BufEnter", {
      group = group,
      pattern = "*.md",
      callback = function()
        vim.defer_fn(function()
          -- Esto "despierta" al plugin para que vuelva a dibujar la imagen bajo el cursor
          vim.cmd("redraw!") 
        end, 50)
      end,
    })
  end,
}

-- En tu archivo de plugins
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Carga esto primero
    config = function()
      require("catppuccin").setup({
        transparent_background = true, -- ¡AQUÍ ESTÁ TU TRANSPARENCIA!
        integrations = {
          treesitter = true, -- Activa los colores especiales de Treesitter
        },
		custom_highlights = function(colors)
			return {
				LineNr = { fg = colors.overlay1 },
				CursorLineNr = { fg = colors.lavender },
				CursorLine = { bg = "NONE" }, -- Quita el fondo gris de la línea actual
				FoldColumn = { bg = "NONE" },
				SignColumn = { bg = "NONE" },
			}
end,
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
  -- ... tu plugin de treesitter abajo
}

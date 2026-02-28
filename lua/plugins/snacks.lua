return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- 1. ACTIVAR DASHBOARD
    dashboard = { 
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    -- 2. AJUSTAR EXPLORER
    explorer = { 
      enabled = true,
      replace_netrw = true, -- Esto quita el "NewFile" al abrir carpetas
    },
    picker = { enabled = true },
    -- Otros ajustes útiles para tu estética
    indent = { enabled = true }, -- Líneas de indentación sutiles
    bigfile = { enabled = true },
  },
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- Atajo extra para volver al Dashboard si quieres
    { "<leader>bdd", function() Snacks.dashboard.open() end, desc = "Open Dashboard" },
  }
}

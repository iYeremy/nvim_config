-- =============================================================================
-- SYSTEM OPTIONS
-- =============================================================================

local opt = vim.opt

-- Editor UI
opt.number = true             -- Show line numbers
opt.relativenumber = false    -- Disable relative numbers
opt.cursorline = true         -- Highlight current line
opt.termguicolors = true      -- Enable 24-bit RGB colors
opt.wrap = false              -- Disable line wrap

-- Tabulation & Indentation
opt.expandtab = false         -- Use tabs
opt.tabstop = 4               -- Tab width
opt.shiftwidth = 4            -- Indent width

-- System Integration
opt.clipboard = "unnamedplus" -- System clipboard support
opt.swapfile = false          -- Disable swap files

-- Diagnostics
vim.diagnostic.config({
  virtual_text = true,
})

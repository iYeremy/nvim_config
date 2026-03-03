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

-- =============================================================================
-- GLOBAL DIAGNOSTIC SIGNS
-- Description: Modern way to define diagnostic icons without deprecation warnings.
-- =============================================================================

local signs = {
  ERROR = " ",
  WARN  = " ",
  HINT  = "󰠠 ",
  INFO  = " "
}

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.ERROR,
      [vim.diagnostic.severity.WARN]  = signs.WARN,
      [vim.diagnostic.severity.HINT]  = signs.HINT,
      [vim.diagnostic.severity.INFO]  = signs.INFO,
    },
  },
})

-- =============================================================================
-- PROVIDERS CONFIGURATION
-- Description: Disabling unused providers to speed up startup and clean healthchecks.
-- =============================================================================

vim.g.loaded_node_provider = 0   -- Use Mason's node, not the system global provider
vim.g.loaded_perl_provider = 0   -- Disable Perl provider
vim.g.loaded_ruby_provider = 0   -- Disable Ruby provider
-- vim.g.loaded_python3_provider = 0 -- Uncomment this only if you won't use Python plugins

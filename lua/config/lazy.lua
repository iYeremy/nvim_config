-- =============================================================================
-- PLUGIN MANAGER CONFIGURATION 
-- =============================================================================

-- Bootstrap lazy.nvim: Automatically install it if it's missing
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- -----------------------------------------------------------------------------
-- Leader Keys
-- Important: These must be set before loading plugins to ensure 
-- mappings from plugins like 'Which-Key' work correctly.
-- -----------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- -----------------------------------------------------------------------------
-- Lazy Setup
-- -----------------------------------------------------------------------------
require("lazy").setup({
  spec = {
    -- Import all plugin files from the lua/plugins/ directory
    { import = "plugins" },
  },
  
  -- Visual configuration for the Lazy UI
  ui = {
    -- If you want a more "Caelestia" look, we keep borders simple
    border = "rounded",
    backdrop = 100, -- Maintains transparency in the background
  },

  -- Plugin update settings
  checker = { 
    enabled = true,   -- Automatically check for updates
    notify = false,   -- Don't show a notification every time it checks
  },

  -- Performance settings
  performance = {
    rtp = {
      -- Disable some unused built-in Neovim plugins for speed
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-----------------------------------------------------------------------
-- Neovim Entry Point
--
-- This file bootstraps the core configuration by loading:
--   1. Plugin manager setup (lazy.nvim)
--   2. Editor options
--   3. Keymaps
--   4. Autocommands
--
-- Keep this file minimal. All logic should live inside lua/config/.
-----------------------------------------------------------------------

-- Core editor settings (UI, behavior, performance)
require("config.options")

-- Load plugin manager and plugin specifications
require("config.lazy")

-- Keybindings
require("config.keymaps")

-- Autocommands
require("config.autocmds")

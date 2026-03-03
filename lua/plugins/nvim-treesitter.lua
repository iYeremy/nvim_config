-- =============================================================================
-- TREESITTER (Syntax Analysis & Highlighting)
-- Description: Advanced parsing for better colors, indent, and structural awareness.
-- Note: Uses a safe require (pcall) to prevent errors during first installation.
-- =============================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Last release is quite old, using master branch is recommended
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- Optimized list for Arch, Hyprland, and general development
    ensure_installed = {
      -- Core Neovim parsers
      "lua", "vim", "vimdoc", "query", "luadoc",
      -- System & Configuration (Critical for Hyprland/Arch users)
      "fish", "bash", "hyprlang", "ron", "toml", "json", "yaml", "dockerfile", "make", "cmake",
      -- Web & Scripting
      "javascript", "typescript", "html", "css", "python",
      -- Low level / Compiled languages
      "c", "cpp", "rust", "go", "java",
      -- Documentation & Images (Essential for image.nvim stability)
      "markdown", "markdown_inline"
    },
    
    -- Syntax Highlighting
    highlight = {
      enable = true,
      -- Disable for very large files to maintain performance
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
    
    -- Structural Indentation
    indent = { enable = true },
  },
  config = function(_, opts)
    -- Safe initialization to prevent 'module not found' errors
    local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end
    ts_configs.setup(opts)

    -- Detect Hyprland configuration files automatically
    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })
  end,
}

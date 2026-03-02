-- =============================================================================
-- LSP CONFIGURATION (nvim-lspconfig)
-- Description: Native LSP setup for multiple languages using Mason.
-- =============================================================================

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- 1. MASON SETUP (Package Manager for LSPs)
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- Auto-install the servers you listed
      ensure_installed = {
        "clangd",
        "fish_lsp",
        "lua_ls",
        "jdtls",
        "pyright",
        "ruff",
      },
    })

    -- 2. CUSTOM SERVER CONFIGURATIONS
    -- JDTLS Path (Mason integration)
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    
    vim.lsp.config("jdtls", {
      cmd = { mason_path .. "/bin/jdtls" },
    })

    -- LUA_LS (Fixing 'undefined global vim')
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enabled = false },
        },
      },
    })

    -- 3. ENABLE SERVERS
    -- This activates the LSPs with the native Neovim 0.10+ method
    vim.lsp.enable({
      "clangd",
      "fish_lsp",
      "hyprls", -- Ensure hyprls is in your PATH
      "ruff",
      "lua_ls",
      "jdtls",
      "pyright",
    })
  end,
}

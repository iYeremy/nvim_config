return {
  "neovim/nvim-lspconfig",
  config = function()

    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

    vim.lsp.config("jdtls", {
      cmd = {
        mason_path .. "/bin/jdtls",
      },
    })

    vim.lsp.enable({
      'clangd',
      'fish_lsp',
      'hyprls',
      'ruff',
      'lua_ls',
      'jdtls',
      'pyright'
    })
  end
}

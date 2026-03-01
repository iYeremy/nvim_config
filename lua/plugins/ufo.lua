return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      -- opciones de fold
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "v:lua.require'ufo'.foldexpr()"

      require("ufo").setup({
        provider_selector = function()
          return { "lsp", "indent" }
        end,
      })
    end,
  },
}

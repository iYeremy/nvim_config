-- =============================================================================
-- UFO.NVIM (Ultra Fold Optimization)
-- Description: Modern code folding using LSP and Treesitter providers.
-- =============================================================================

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost", -- Load when opening a file
  opts = {
    -- Use LSP as main provider and indent as fallback
    provider_selector = function(bufnr, filetype, buftype)
      return { "lsp", "indent" }
    end,
    -- Add virtual text to the end of the folded line
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ("  󰁂 %d lines "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          table.insert(newVirtText, { chunkText, chunk[2] })
          curWidth = curWidth + vim.fn.strdisplaywidth(chunkText)
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end,
  },
  config = function(_, opts)
    -- Global fold options
    vim.o.foldcolumn = "0"     -- Hide the fold column for a cleaner look
    vim.o.foldlevel = 99      -- Start with all folds open
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require("ufo").setup(opts)

    -- Keybindings for folding
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  end,
}

-- =============================================================================
-- KEYBINDINGS CONFIGURATION
-- Description: Custom mappings for buffers, navigation, and plugin integration.
-- =============================================================================

local keymap = vim.keymap

-- -----------------------------------------------------------------------------
-- Buffer Management (<leader>b)
-- -----------------------------------------------------------------------------

-- Navigate to the next buffer in the current window
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { 
  silent = true, 
  desc = "Buffer: Next" 
})

-- Navigate to the previous buffer in the current window
keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { 
  silent = true, 
  desc = "Buffer: Previous" 
})

-- Close the current buffer
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { 
  silent = true, 
  desc = "Buffer: Delete" 
})

-- Close all buffers except the one currently active
keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { 
  silent = true, 
  desc = "Buffer: Delete Others" 
})

-- Toggle buffer picker using Snacks.nvim
keymap.set("n", "<leader>bb", function()
  if Snacks then
    Snacks.picker.buffers()
  else
    print("Snacks.nvim not found")
  end
end, { 
  silent = true, 
  desc = "Buffer: Picker List" 
})

-- -----------------------------------------------------------------------------
-- Window Navigation (Direct access via Ctrl)
-- Description: Jump between splits without the <C-w> prefix.
-- -----------------------------------------------------------------------------

-- Move to the split on the LEFT
keymap.set("n", "<c-h>", "<C-w>h", { 
  silent = true, 
  desc = "Window: Focus Left" 
})

-- Move to the split BELOW
keymap.set("n", "<c-j>", "<C-w>j", { 
  silent = true, 
  desc = "Window: Focus Down" 
})

-- Move to the split ABOVE
keymap.set("n", "<c-k>", "<C-w>k", { 
  silent = true, 
  desc = "Window: Focus Up" 
})

-- Move to the split on the RIGHT (Perfect for Explorer)
keymap.set("n", "<c-l>", "<C-w>l", { 
  silent = true, 
  desc = "Window: Focus Right" 
})

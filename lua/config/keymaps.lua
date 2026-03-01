-- ================================
-- Buffer Management Keybindings
-- Namespace: <leader>b
-- ================================

-- Go to next buffer
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", {
  silent = true,
  desc = "Buffer: Next",
})

-- Go to previous buffer
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", {
  silent = true,
  desc = "Buffer: Previous",
})

-- Delete current buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>", {
  noremap = true,
  silent = true,
  desc = "Buffer: Delete",
})

-- Delete all buffers except the current onee
vim.keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end, {
  silent = true,
  desc = "Buffer: Delete Others",
})

-- Open buffer picker (Snacks)
vim.keymap.set("n", "<leader>bb", function()
  Snacks.picker.buffers()
end, {
  silent = true,
  desc = "Buffer: List",
})


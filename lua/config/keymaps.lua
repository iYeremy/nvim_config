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



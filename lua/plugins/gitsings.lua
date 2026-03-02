-- =============================================================================
-- GIT INTEGRATION (gitsigns.nvim)
-- Description: Minimalist vertical bars for git status and hunk navigation.
-- =============================================================================

return {
  "lewis6991/gitsigns.nvim",
  -- Load plugin when a buffer is read or a new file is created
  event = { "BufReadPre", "BufNewFile" },
  
  opts = {
    -- -------------------------------------------------------------------------
    -- Visual Configuration (Sign Column)
    -- Using vertical bars to distinguish git changes from diagnostic icons.
    -- -------------------------------------------------------------------------
    signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      delete       = { text = "" },
      topdelete    = { text = "" },
      changedelete = { text = "▎" },
      untracked    = { text = "▎" },
    },

    -- UI Settings
    signcolumn          = true,  -- Always show the sign column
    numhl               = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl              = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff           = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir        = { interval = 1000, follow_files = true },
    attach_to_untracked = true,

    -- Floating window appearance for hunk previews
    preview_config = {
      border   = "rounded",
      style    = "minimal",
      relative = "cursor",
      row      = 0,
      col      = 1,
    },

    -- -------------------------------------------------------------------------
    -- Keybindings (on_attach)
    -- -------------------------------------------------------------------------
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation: Jump between hunks (changes)
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "Git: Next Change" })

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = "Git: Previous Change" })

      -- Actions: Preview changes and Blame
      map('n', '<leader>gp', gs.preview_hunk, { desc = "Git: Preview Hunk" })
      map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, { desc = "Git: Blame Line" })
      map('n', '<leader>gr', gs.reset_hunk, { desc = "Git: Reset Hunk" })
    end,
  },
}

-- =============================================================================
-- LSP CONFIGURATION (nvim-lspconfig)
-- Description: Native LSP setup for multiple languages using Mason.
-- Note: Integrated with blink.cmp for enhanced completion capabilities.
-- =============================================================================

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp", -- Ensures completion capabilities are available
  },
  config = function()
    -- MASON SETUP (Package Manager for LSPs)
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "fish_lsp",
        "lua_ls",
        "jdtls",
        "pyright",
        "ruff",
      },
    })

    -- BLINK CAPABILITIES
    -- Informs LSPs that we support advanced completion features
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- CUSTOM SERVER CONFIGURATIONS
    -- JDTLS Path (Mason integration)
	local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
	local lombok_path = vim.fn.expand("~/.local/share/java/lombok.jar")

	local function project_uses_lombok()
	  -- Detecta Maven
	  if vim.fn.filereadable("pom.xml") == 1 then
		local content = table.concat(vim.fn.readfile("pom.xml"), "\n")
		if content:match("lombok") then
		  return true
		end
	  end

	  -- Detecta Gradle
	  if vim.fn.filereadable("build.gradle") == 1 then
		local content = table.concat(vim.fn.readfile("build.gradle"), "\n")
		if content:match("lombok") then
		  return true
		end
	  end

	  return false
	end

	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

	local cmd = {
	  mason_path .. "/bin/jdtls",
	  "-data",
	  workspace_dir,
	  "--jvm-arg=-Xms1g",
	  "--jvm-arg=-Xmx2g",
	}

	if project_uses_lombok() then
	  table.insert(cmd, "--jvm-arg=-javaagent:" .. lombok_path)
	  table.insert(cmd, "--jvm-arg=-Xbootclasspath/a:" .. lombok_path)
	end

	vim.lsp.config("jdtls", {
	  cmd = cmd,
	  capabilities = capabilities,
	})

    -- LUA_LS (Fixing 'undefined global vim')
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enabled = false },
        },
      },
    })

    -- Default configuration for other servers
    local servers = { "clangd", "fish_lsp", "hyprls", "ruff", "pyright" }
    for _, server in ipairs(servers) do
      vim.lsp.config(server, { capabilities = capabilities })
    end

    -- ENABLE SERVERS
    -- Activates LSPs with the native Neovim 0.10+ method
    vim.lsp.enable({
      "clangd",
      "fish_lsp",
      "hyprls",
      "ruff",
      "lua_ls",
      "jdtls",
      "pyright",
    })
  end,
}

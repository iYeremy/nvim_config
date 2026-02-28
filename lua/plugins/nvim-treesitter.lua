return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- Lista optimizada para un usuario de Arch/Hyprland/Personalización
    local languages = {
      -- Fundamentales de Neovim
      'lua', 'vim', 'vimdoc', 'query',
      
      -- Sistema y Configuración (Claves para Hyprland/Arch)
      'fish','bash', 'hyprlang', 'ron', 'toml', 'json', 'yaml', 'dockerfile', 'make', 'cmake',
      
      -- Web / Scripting
      'javascript', 'typescript', 'html', 'css', 'python',
      
      -- Bajo nivel / Otros
      'c', 'cpp', 'rust', 'go', 'java', 'markdown', 'markdown_inline', 'dockerfile'
    }

    -- Instalación
    require('nvim-treesitter').install(languages)

    -- Resaltado Inteligente (Protegido con pcall para evitar el error anterior)
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        -- Solo inicia si el lenguaje está soportado para evitar errores en archivos raros
        pcall(vim.treesitter.start)
      end,
    })

    -- Indentación automática basada en Treesitter
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end)
      end,
    })
  end
}

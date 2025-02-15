return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Ícones opcionais
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto', -- Usa o tema do Neovim
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  }
}


return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "pyright", "rust_analyzer" },
          auto_install = true,
        })
      end,
    },
  },
    config = function()
    local lspconfig = require("lspconfig")

    -- Configuração do clangd para C++
    lspconfig.clangd.setup({
      cmd = { "clangd", "--background-index" },  -- Comando para iniciar o clangd
      filetypes = { "c", "cpp", "objc", "objcpp" },  -- Tipos de arquivo que o clangd vai lidar
      root_dir = lspconfig.util.root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),  -- Identifica o diretório raiz do projeto
      settings = {
        clangd = {
          extraArgs = { "--clang-tidy" },  -- Ativa o clang-tidy (opcional)
        },
      },
    })
  end,
}

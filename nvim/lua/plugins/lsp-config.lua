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
}


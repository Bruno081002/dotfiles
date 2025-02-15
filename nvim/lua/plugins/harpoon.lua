return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      -- Atalhos para adicionar arquivos ao Harpoon
      vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

      -- Atalhos para navegar entre os arquivos marcados
      vim.api.nvim_set_keymap("n", "<leader>n", ":lua require('harpoon.ui').nav_next()<CR>", { noremap = true, silent = true }) -- Próximo arquivo
      vim.api.nvim_set_keymap("n", "<leader>p", ":lua require('harpoon.ui').nav_prev()<CR>", { noremap = true, silent = true }) -- Arquivo anterior
    end
  }
}


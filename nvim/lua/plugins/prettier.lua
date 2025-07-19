return {
    {
        'neovim/nvim-lspconfig',
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,  -- Adiciona o Prettier como formatador
                    null_ls.builtins.formatting.clang_format,  -- Adiciona o clang-format como formatador
                },
            })
        end,
    },
    {
        'MunifTanjim/prettier.nvim',
        config = function()
            require("prettier").setup({
                bin = 'prettier',  -- Usa o Prettier instalado no sistema
                filetypes = {
                    "javascript", "typescript", "css", "scss", "json", "markdown", "cpp"
                }
            })
        end,
    },
	-- Configuração do keybinding para Ctrl+S, fora da tabela de plugins
	vim.api.nvim_set_keymap("n", "<C-s>", ":lua vim.lsp.buf.formatting_sync()<CR>", { noremap = true, silent = true })

}



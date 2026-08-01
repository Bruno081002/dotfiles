return {
    -- LSP config
    {
        'neovim/nvim-lspconfig',
    },
    -- none-ls (replacement for null-ls)
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.clang_format,
                },
                -- Remap = to LSP format in supported filetypes
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.keymap.set({ "n", "v" }, "=", function()
                            vim.lsp.buf.format({ bufnr = bufnr, async = true })
                        end, { buffer = bufnr, desc = "Format with Prettier (none-ls)" })
                    end
                end,
            })
        end,
    },
    -- REMOVED: prettier.nvim (was conflicting with none-ls)
}

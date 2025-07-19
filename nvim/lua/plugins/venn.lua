
return {
    {
        "jbyuki/venn.nvim",
        config = function()

            -- Função para alternar o estado dos keymaps
            function _G.Toggle_venn()
                local venn_enabled = vim.inspect(vim.b.venn_enabled)
                if venn_enabled == "nil" then
                    vim.b.venn_enabled = true
                    vim.cmd[[setlocal ve=all]]
                    -- Desenhar uma linha com as teclas HJKL
                    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
                    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
                    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
                    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
                    -- Desenhar uma caixa ao pressionar "f" na seleção visual
                    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
                else
                    vim.cmd[[setlocal ve=]]
                    vim.api.nvim_buf_del_keymap(0, "n", "J")
                    vim.api.nvim_buf_del_keymap(0, "n", "K")
                    vim.api.nvim_buf_del_keymap(0, "n", "L")
                    vim.api.nvim_buf_del_keymap(0, "n", "H")
                    vim.api.nvim_buf_del_keymap(0, "v", "f")
                    vim.b.venn_enabled = nil
                end
            end

            -- Mapear o comando para alternar o estado do Venn com <leader>v
            vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true })
        end,
    },
}


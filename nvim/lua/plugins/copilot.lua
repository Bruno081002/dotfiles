return {
    {
        "github/copilot.vim",
        config = function()
            -- Optionally, add any Copilot-specific configuration here
	    vim.g.copilot_enabled = false
            vim.cmd([[imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")]])
            vim.g.copilot_no_tab_map = true
        end,
    }
}

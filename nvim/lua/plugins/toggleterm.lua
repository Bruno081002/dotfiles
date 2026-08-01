
return {
	{
		-- amongst your other plugins
		'akinsho/toggleterm.nvim',
		version = '*',
		config = function()
			require("toggleterm").setup({
				-- Keybinding to toggle terminal
				dir = "file_dir",
				open_mapping = [[<C-t>]],  -- Press <C-t> to toggle the terminal
				size = 20,                 -- Set default terminal size
				start_in_insert = true,
				persist_size = true,
				direction = "horizontal",  -- You can set 'horizontal', 'vertical', or 'float'
				shade_filetypes = {},      -- You can specify filetypes to shade, leave empty for all
				shade_terminals = true,    -- If you want shading for the terminal window
				highlights = {
					border = "FloatBorder",  -- Highlight for the terminal border
					background = "Normal",   -- Highlight for the terminal background
				},
			})
			vim.keymap.set("n", "<leader>t1", ":ToggleTerm 1<CR>", { desc = "Terminal 1" })
			vim.keymap.set("n", "<leader>t2", ":ToggleTerm 2<CR>", { desc = "Terminal 2" })
			vim.keymap.set("n", "<leader>t3", ":ToggleTerm 3<CR>", { desc = "Terminal 3" })
			vim.keymap.set("n", "<leader>t4", ":ToggleTerm 4<CR>", { desc = "Terminal 4" })
		end,
	}
}


return{
	 "nvim-neo-tree/neo-tree.nvim",
	 branch = "v3.x",
	 dependencies = {
		 "nvim-lua/plenary.nvim",
		 "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		 "MunifTanjim/nui.nvim",
		 -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	 },

	 config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitinored = false,
				},

			},

		 })
		 vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
		 vim.keymap.set("n", "<leader>f", ":Neotree focus<CR>", { noremap = true, silent = true })
	 end,

}

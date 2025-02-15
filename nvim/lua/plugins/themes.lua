return{
	"loctvl842/monokai-pro.nvim",
	config = function()
		require("monokai-pro").setup({
			filter = "classic",
			transparent_background = true,
		})
		vim.cmd("colorscheme monokai-pro")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
}

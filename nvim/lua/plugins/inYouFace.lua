return {

	"Wordluc/in-your-face.nvim",
	config=function ()
		vim.api.nvim_create_user_command('DoomFace', function()
			require("in-your-face").setup();
		end, { bang = true, nargs = '*' })
		vim.api.nvim_create_user_command('DoomFaceKill', function()
			require("in-your-face").close();
		end,{ bang = true, nargs = '*' })
	end




}

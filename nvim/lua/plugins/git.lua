
return {
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Abrir LazyGit" },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gblame", "Glog", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Abrir Git status" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
	  untracked    = { text = '┆' },
        },
	signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,
        numhl = false,
        linehl = false,
	word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
 	watch_gitdir = {
        	follow_files = true
  	},
	auto_attach = true,
        attach_to_untracked = false,
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = true, -- Habilita blame na linha atual
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 500,
	  ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
  	status_formatter = nil, -- Use default
  	max_file_length = 40000, -- Disable if file is longer than this (in lines)
  	preview_config = {
    		-- Options passed to nvim_open_win
    		border = 'single',
    		style = 'minimal',
    		relative = 'cursor',
    		row = 0,
    		col = 1
  	},      
			})
    end,
  },
}


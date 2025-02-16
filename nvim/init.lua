require("config.lazy")

vim.opt.termguicolors = true
vim.opt.relativenumber = true  
vim.opt.number = true          
vim.opt.clipboard = "unnamedplus"   
-- vim.o.termguicolors = true
vim.cmd[[highlight NeoTreeNormal guibg=none]]
vim.cmd[[highlight NeoTreeFileName guibg=none]]
vim.cmd[[highlight NeoTreeDirectoryName guibg=none]]
vim.cmd[[highlight NeoTreeRootName guibg=none]]
vim.cmd[[highlight NeoTreeHiddenFileName guibg=none]]
vim.cmd[[highlight NERDTreeDir guibg=none]]
vim.cmd[[highlight NERDTreeOpenable guibg=none]]
vim.cmd[[highlight NeoTreeNormal guibg=none]]          -- For the normal state (unfocused)
vim.cmd[[highlight NeoTreeNormalNC guibg=none]]        -- For the non-focused state (unfocused)
vim.cmd[[highlight NeoTreeDirectoryName guibg=none]]   -- For the folder name background (unfocused)
vim.cmd[[highlight NeoTreeFileName guibg=none]]        -- For the file name background (unfocused)
vim.cmd[[highlight NeoTreeRootName guibg=none]]        -- For the root name background (unfocused)
vim.cmd[[highlight NeoTreeHiddenFileName guibg=none]]  -- For the hidden files (unfocused)

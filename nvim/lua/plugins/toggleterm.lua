
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
        direction = "horizontal",  -- You can set 'horizontal', 'vertical', or 'float'
        shade_filetypes = {},      -- You can specify filetypes to shade, leave empty for all
        shade_terminals = true,    -- If you want shading for the terminal window
        highlights = {
          border = "FloatBorder",  -- Highlight for the terminal border
          background = "Normal",   -- Highlight for the terminal background
        },
      })
    end,
  },

  -- You can use this as an alternative way of configuring options with `opts` (but not both)
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      -- Your custom options go here
      open_mapping = [[<C-t>]],  -- Press <C-t> to toggle the terminal
      size = 20,                 -- Set default terminal size
      direction = "horizontal",  -- You can set 'horizontal', 'vertical', or 'float'
    },
  },

  -- Additional custom configuration without changing existing setups
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require("toggleterm").setup({
        -- Size can be a number or function which is passed the current terminal
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        
        -- Keybinding to toggle terminal
        open_mapping = [[<C-t>]],  -- Change this to whatever keybinding you prefer

        -- Callback functions
        on_create = function(t) end,     -- Function to run when the terminal is created
        on_open = function(t) end,       -- Function to run when the terminal opens
        on_close = function(t) end,      -- Function to run when the terminal closes
        on_stdout = function(t, job, data, name) end,  -- Callback for processing stdout
        on_stderr = function(t, job, data, name) end,  -- Callback for processing stderr
        on_exit = function(t, job, exit_code, name) end,  -- Function to run when terminal process exits

        hide_numbers = true,  -- Hide the number column in toggleterm buffers
        shade_filetypes = {},  -- No filetypes to shade by default
        autochdir = false,     -- Do not automatically change terminal directory when Neovim changes

        highlights = {
          Normal = { guibg = "#282828", guifg = "#ebdbb2" },  -- Customize the background color
          NormalFloat = { link = 'Normal' },
          FloatBorder = {
            guifg = "#fb4934", 
    	    guibg = "#3c3836",
          },
        },
        
        shade_terminals = true,  -- Enable shading for terminal windows
        shading_factor = -30,    -- Percentage by which to lighten the terminal background
        shading_ratio = -3,      -- Ratio of shading factor for light/dark backgrounds
        start_in_insert = true,  -- Start in insert mode
        insert_mappings = true,  -- Apply open mapping in insert mode
        terminal_mappings = true, -- Apply open mapping in opened terminals
        persist_size = true,     -- Persist terminal size across sessions
        persist_mode = true,     -- Remember the terminal's previous mode
        direction = 'horizontal',  -- Terminal direction ('vertical', 'horizontal', 'float', 'tab')
        close_on_exit = true,    -- Close the terminal window when the process exits
        clear_env = false,       -- Do not clear environmental variables when launching terminal
        
        -- Change the default shell
        shell = vim.o.shell,
        
        auto_scroll = true,  -- Automatically scroll to the bottom on terminal output
        
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
          border = 'single',  -- Border type for the floating terminal
          width = 80,         -- Width of the floating terminal
          height = 20,        -- Height of the floating terminal
          row = 1,            -- Row position
          col = 1,            -- Column position
          winblend = 3,       -- Window blend
          zindex = 100,       -- Z-index for floating window
          title_pos = 'left', -- Title position for the floating terminal
        },

        -- Terminal winbar configuration
        winbar = {
          enabled = false,
          name_formatter = function(term) return term.name end,
        },

        -- Responsiveness for terminal stacking at a breakpoint
        responsiveness = {
          horizontal_breakpoint = 135,  -- Breakpoint for stacking terminals on smaller screen widths
        }
      })
    end,
  }
}


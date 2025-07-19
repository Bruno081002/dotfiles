return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        },
      },

      messages = {
        enabled = true,
        view = "mini",        
        view_error = "notify", 
        view_warn = "notify",  
        view_history = "messages",
        view_search = false,   
      },

      popupmenu = {
        enabled = true,
        backend = "nui",
      },

      notify = {
        enabled = true,
        view = "notify",
      },

      lsp = {
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
          view = nil, -- Use default float view
        },
        signature = {
          enabled = true,
        },
        message = {
          enabled = true,
          view = "mini",
        },
      },

      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 40,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
          },
        },

        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 40,
            height = 2,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },

      routes = {
        {
          filter = {
            event = "msg_showmode",
          },
          opts = { skip = true }, -- hide -- INSERT -- and similar messages
        },
      },

      presets = {
        bottom_search = false,  -- keep searches in popup
        command_palette = true, -- position cmdline + popupmenu together
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    })

    -- OPTIONAL: configure notify background color (avoid warning)
    require("notify").setup({
      background_colour = "#1a1b26", -- replace with your theme's float bg
    })
  end,
}

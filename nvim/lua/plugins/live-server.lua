return {
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",  -- Ensure live-server is installed globally
    cmd = { "LiveServerStart", "LiveServerStop" },  -- Commands for triggering the live server
    config = function()
      -- Here you can call any setup function that the plugin provides if needed
      -- This is just an example assuming the plugin has a setup method
      require("live-server").setup()
    end
  }
}


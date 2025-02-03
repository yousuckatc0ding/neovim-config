return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Enable or disable specific features
    bigfile = { enabled = true },
    dashboard = {
      enabled = false,
      header = {
        " ██████╗ ███╗   ██╗ █████╗  ██████╗██╗  ██╗",
        "██╔════╝ ████╗  ██║██╔══██╗██╔════╝██║ ██╔╝",
        "██║  ███╗██╔██╗ ██║███████║██║     █████╔╝ ",
        "██║   ██║██║╚██╗██║██╔══██║██║     ██╔═██╗ ",
        "╚██████╔╝██║ ╚████║██║  ██║╚██████╗██║  ██╗",
        " ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝",
      },
      footer = {
        "Welcome to Neovim!",
        "Powered by snacks.nvim",
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}

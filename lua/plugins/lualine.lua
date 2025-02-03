return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
        theme = "embark", -- Match your colorscheme
        section_separators = { left = "", right = "" }, -- Fancy separators
        component_separators = { left = "", right = "" },
        icons_enabled = true, -- Enable icons
        globalstatus = true, -- Single statusline for all windows
        disabled_filetypes = { "dashboard", "lazy" }, -- Disable lualine for specific filetypes
      },
      sections = {
        -- Left section
	lualine_a = {
	  {
	    "mode",
	    fmt = function(str)
	      -- Define a lookup table for mode abbreviations
	      local mode_map = {
		["NORMAL"] = "NRML",
		["INSERT"] = "INSRT",
		["VISUAL"] = "VIS",
		["V-LINE"] = "VLINE",
		["V-BLOCK"] = "VBLOCK",
		["REPLACE"] = "RPL",
		["COMMAND"] = "CMD",
		["SELECT"] = "SEL",
		["S-LINE"] = "SLINE",
		["S-BLOCK"] = "SBLOCK",
		["TERMINAL"] = "TERM",
	      }
	      -- Return the abbreviation or the original string if not found
	      return mode_map[str] or str
	    end,
	  },
	},
        lualine_b = {
          { "branch", icon = "" }, -- Git branch with icon
          { "diff", symbols = { added = " ", modified = " ", removed = " " } }, -- Git diff with custom symbols
        },
        -- Center section
        lualine_c = { 
          { "filename", path = 1, symbols = { modified = " ", readonly = " " } }, -- Show relative path with icons for modified/readonly
          {
            function()
              return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
            end, 
            color = { fg = "#a9b1d6", gui = "bold" }, -- Show current working directory
          },
        },
        -- Right section
        lualine_x = {
          { "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            colored = true,
            update_in_insert = false,
            always_visible = true,
          },
          "encoding", -- File encoding (e.g., UTF-8)
          "fileformat", -- File format (e.g., Unix, DOS)
          "filetype", -- File type (e.g., Lua, Python)
        },
        lualine_y = { "progress" }, -- Show progress (e.g., 45%)
        lualine_z = { "location" }, -- Show cursor location (e.g., line:column)
      },
      inactive_sections = {
        -- Minimal statusline for inactive windows
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "fugitive", "nvim-tree", "quickfix", "toggleterm" }, -- Add extensions for specific plugins
    })
  end,
}

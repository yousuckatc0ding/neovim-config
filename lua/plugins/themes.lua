return {
  {
    "rebelot/kanagawa.nvim",
    lazy=false,
    version = "*",
    config = function()
        vim.cmd.colorscheme("kanagawa-wave")
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    version = "*"
  },
  {
    "Mofiqul/dracula.nvim",
    version = "*"

  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    -- config = function()
    --     require('nordic').load()
    -- end
  },
  {
	  "embark-theme/vim",
	  as = "embark",
	  -- config = function()
	  --  vim.cmd.colorscheme("embark")
	  -- end
  },
  {
    'bettervim/yugen.nvim',
    -- config = function()
    --     vim.cmd.colorscheme('yugen')
    -- end,
  },
}

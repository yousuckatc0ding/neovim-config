require("config.lazy")
require("lazy").setup("plugins")

vim.api.nvim_set_keymap('n', '<leader>srg', ':<C-u>1,$s/', { noremap = true })



vim.api.nvim_set_option("clipboard","unnamed")
-- vim.cmd.colorscheme("nordic")

vim.cmd("Copilot disable")

-- Move to the left pane
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- Move to the right pane
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- Move to the upper pane
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- Move to the lower pane
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })


-- Common tab/space configuration
vim.opt.tabstop = 4        -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for autoindent
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.softtabstop = 4    -- Number of spaces that a <Tab> counts for while editing

local fzf_lua = require("fzf-lua")

function _G.git_diff()
  -- Run the git diff command to get the list of changed files
  local list = vim.fn.systemlist("git diff --name-only main")

  -- Check for errors in the git command
  if vim.v.shell_error ~= 0 then
    print("Error running git diff")
    return
  end

  -- Use fzf-lua to display the list of files
  fzf_lua.fzf_exec(list, {
    prompt = "Git Diff > ",
    actions = {
      -- Open the selected file in the current buffer
      ["default"] = function(selected)
        vim.cmd("edit " .. selected[1])
      end,
      -- Open the selected file in a vertical split
      ["ctrl-v"] = function(selected)
        vim.cmd("vsplit " .. selected[1])
      end,
      -- Open the selected file in a horizontal split
      ["ctrl-x"] = function(selected)
        vim.cmd("split " .. selected[1])
      end,
    },
  })
end


vim.keymap.set("n", "<leader>gf", git_diff, { noremap = true, silent = true })

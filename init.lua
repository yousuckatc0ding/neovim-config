require("config.lazy")
require("lazy").setup("plugins")



vim.api.nvim_set_option("clipboard","unnamed")
vim.cmd.colorscheme("nordic")

vim.cmd("Copilot disable")

-- Move to the left pane
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- Move to the right pane
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- Move to the upper pane
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- Move to the lower pane
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })

return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional for icons
    config = function()
        require('fzf-lua').setup({
		winopts = {
			height = 0.85,
			width = 0.80,
			border = 'rounded',
		}
	})
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        map('n', '<leader>ff', ":lua require('fzf-lua').files()<CR>", opts)
        map('n', '<leader>fg', ":lua require('fzf-lua').grep()<CR>", opts)
        map('n', '<leader>fb', ":lua require('fzf-lua').buffers()<CR>", opts)
        map('n', '<leader>lg', ":lua require('fzf-lua').live_grep()<CR>", opts)

    end,
}

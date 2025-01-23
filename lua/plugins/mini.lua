return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Import mini.statusline locally
    local MiniStatusline = require('mini.statusline')

    -- Override section_mode to customize mode display
    MiniStatusline.section_mode = function()
      local mode_map = {
        n = 'NRML',
        i = 'NSRT',
        v = 'VIS',
        V = 'VLINE',
        [''] = 'VBLK',
        c = 'CMD',
        t = 'TERM'
      }
      return '🟢 ' .. (mode_map[vim.fn.mode()] or '🔴 UNKWN') .. ' '
    end

    -- Setup mini.statusline with custom content
    MiniStatusline.setup({
	
    })
  end
}

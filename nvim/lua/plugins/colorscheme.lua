return {
  'loctvl842/monokai-pro.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('monokai-pro').setup {
      styles = {},
      filter = 'spectrum',
      override = function(c)
        local hp = require 'monokai-pro.color_helper'
        local common_fg = hp.lighten(c.sideBar.foreground, 30)
        return {
          SnacksPicker = { bg = c.editor.background, fg = common_fg },
          SnacksPickerBorder = { bg = c.editor.background, fg = c.tab.unfocusedActiveBorder },
          SnacksPickerTree = { fg = c.editorLineNumber.foreground },
          NonText = { fg = c.base.dimmed3 }, -- not sure if this should be broken into all hl groups importing NonText
        }
      end,
    }
    vim.cmd.colorscheme 'monokai-pro'
  end,
}

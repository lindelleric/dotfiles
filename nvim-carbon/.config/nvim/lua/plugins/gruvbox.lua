-- taken from https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua
local c = {
  dark_brown = '#3b3307',
  dark_green = '#142a03',
  dark_red = '#431313',
  dark_yellow = '#4d520d',
  dark0_hard = '#1d2021', -- alacritty bg
  dark0 = '#282828',
  dark0_soft = '#32302f',
  dark1 = '#3c3836',
  dark2 = '#504945',
  dark3 = '#665c54',
  dark4 = '#7c6f64',
  light_brown = '#fdd69b',
  light_green = '#d5e958',
  light_red = '#ffb3a2',
  light_yellow = '#ffdb57',
  light0_hard = '#f9f5d7',
  light0 = '#fbf1c7',
  light0_soft = '#f2e5bc',
  light1 = '#ebdbb2',
  light2 = '#d5c4a1',
  light3 = '#bdae93',
  light4 = '#a89984',
  bright_red = '#fb4934',
  bright_green = '#b8bb26',
  bright_yellow = '#fabd2f',
  bright_blue = '#83a598',
  bright_purple = '#d3869b',
  bright_aqua = '#8ec07c',
  bright_orange = '#fe8019',
  neutral_red = '#cc241d',
  neutral_green = '#98971a',
  neutral_yellow = '#d79921',
  neutral_blue = '#458588',
  neutral_purple = '#b16286',
  neutral_aqua = '#689d6a',
  neutral_orange = '#d65d0e',
  faded_red = '#9d0006',
  faded_green = '#79740e',
  faded_yellow = '#b57614',
  faded_blue = '#076678',
  faded_purple = '#8f3f71',
  faded_aqua = '#427b58',
  faded_orange = '#af3a03',
  gray = '#928374',
}
return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  opts = {
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = false,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = 'hard', -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
      Comment = { italic = true }, -- popup menu colors
      ['@include'] = { fg = c.bright_red }, -- Import statements
      ['@type'] = { fg = c.light0 }, -- Stuff with capital letters are treated as types, including importedimported  components
      ['@arrowfunction.arrow'] = { fg = c.bright_red }, -- arrowfunction =>
      ['@function.call'] = { fg = c.bright_blue }, -- Functions
      ['@method.call'] = { fg = c.bright_blue }, -- Functions
      ['@method'] = { fg = c.bright_blue }, -- Functions
      ['@tag'] = { fg = c.bright_aqua }, -- tsx tags
      ['@tag.delimiter'] = { fg = c.bright_aqua }, -- <> chars for tsx tags
      ['@constructor'] = { fg = c.bright_aqua }, -- Some components are treated as constructors
      ['@operator'] = { fg = c.bright_purple }, -- = &&
      ['@number'] = { fg = c.bright_yellow }, -- number literals
      ['@property'] = { fg = c.light0_soft }, -- ojb.property {property: 1}
      ['@punctuation.bracket'] = { fg = c.light0_soft }, -- < > ()
      ['@punctuation.delimiter'] = { fg = c.light0_soft }, -- .
      ['@array.bracket'] = { fg = c.bright_orange }, -- [ ]
      ['@object.brace'] = { fg = c.bright_orange }, -- [ ]
      ['@jsx.expression.brace'] = { fg = c.bright_orange }, -- <jsx> {these breaces} </jsx>
      ['@jsx.prop.brace'] = { fg = c.bright_purple }, -- <jsx> {these breaces} </jsx>
      ['@type.enclosingtags'] = { fg = c.bright_purple }, -- <jsx> {these breaces} </jsx>
      ['@type.identifier'] = { fg = c.bright_yellow }, -- <jsx> {these breaces} </jsx>

      -- Stuff for neo-tree
      NeoTreeGitModified = { bg = 'NONE', fg = c.bright_blue },
      NeoTreeGitUntracked = { bg = 'NONE', fg = c.bright_green },
      NeoTreeDirectoryName = { fg = c.light2 },
      NeoTreeDirectoryIcon = { fg = c.dark4 },
      NeoTreeFileName = { fg = c.light2 },

      -- Stuff for gitsigns
      GitSignsAdd = { bg = 'NONE', fg = c.bright_green },
      GitSignsDelete = { bg = 'NONE', fg = c.bright_red },
      -- GitSignsChange = {bg = 'NONE', fg = c.bright_yellow},
      GitSignsUntracked = { bg = 'NONE', fg = c.bright_green },
      GitSignsCurrentLineBlame = { bg = 'NONE', fg = c.dark3 },
    },
  },
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme 'gruvbox'

    local M = {}

    M.highlight = function(group, options)
      local guifg = options.fg or 'NONE'
      local guibg = options.bg or 'NONE'
      local guisp = options.sp or 'NONE'
      local gui = options.gui or 'NONE'
      local blend = options.blend or 0
      local ctermfg = options.ctermfg or 'NONE'

      vim.cmd(string.format('highlight %s guifg=%s ctermfg=%s guibg=%s guisp=%s gui=%s blend=%d', group, guifg, ctermfg, guibg, guisp, gui, blend))
    end
    -- Blankline
    M.highlight('IblIndent', { fg = c.dark0, gui = 'nocombine' })
    M.highlight('IblWhitespace', { fg = c.dark0, gui = 'nocombine' })
    M.highlight('IblScope', { fg = c.dark2, gui = 'nocombine' })
    -- M.highlight("IndentBlanklineContextStart", { sp = c.dark0, gui = "underline" })
    -- M.highlight("IndentBlanklineContextSpaceChar", { gui = "nocombine" })

    vim.cmd 'set cursorline'
    vim.cmd 'hi CursorLine guibg=#292929'
    vim.cmd 'hi CursorLineNr gui=bold guibg=#292929'

    vim.cmd 'set signcolumn=yes'
    vim.cmd 'hi SignColumn guibg=#1d2021'
  end,
  config = true,
}

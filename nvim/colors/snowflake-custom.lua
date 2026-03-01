-- Snowflake Custom: standalone colorscheme based on tokyonight-night
-- with custom background and comment colors to match VSCode Snowflake Contrast

vim.cmd('highlight clear')
vim.o.termguicolors = true
vim.g.colors_name = 'snowflake-custom'

local function blend(fg, alpha, bg)
  local function rgb(c)
    return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
  end
  local f, b = rgb(fg), rgb(bg)
  local function ch(i) return math.floor(math.min(math.max(0, alpha * f[i] + (1 - alpha) * b[i]), 255) + 0.5) end
  return string.format('#%02x%02x%02x', ch(1), ch(2), ch(3))
end

-- Palette (tokyonight-night base with custom overrides)
local bg         = '#121720'
local bg_dark    = '#0e1219'
local fg         = '#c0caf5'
local fg_dark    = '#a9b1d6'
local fg_gutter  = '#3b4261'
local comment    = '#777788'
local blue       = '#7aa2f7'
local blue0      = '#3d59a1'
local blue1      = '#2ac3de'
local blue2      = '#0db9d7'
local blue5      = '#89ddff'
local blue6      = '#b4f9f8'
local blue7      = '#394b70'
local cyan       = '#7dcfff'
local dark3      = '#545c7e'
local dark5      = '#737aa2'
local green      = '#9ece6a'
local green1     = '#73daca'
local green2     = '#41a6b5'
local magenta    = '#bb9af7'
local magenta2   = '#ff007c'
local orange     = '#ff9e64'
local purple     = '#9d7cd8'
local red        = '#f7768e'
local red1       = '#db4b4b'
local teal       = '#1abc9c'
local term_black = '#414868'
local yellow     = '#e0af68'

-- Derived colors
local black            = blend(bg, 0.8, '#000000')
local bg_highlight     = '#292e42'
local border           = black
local border_highlight = blend(blue1, 0.8, bg)
local bg_popup         = bg_dark
local bg_statusline    = bg_dark
local bg_sidebar       = bg_dark
local bg_float         = bg
local bg_visual        = blend(blue0, 0.4, bg)
local bg_search        = blue0

local diff_add    = blend(green2, 0.25, bg)
local diff_delete = blend(red1, 0.25, bg)
local diff_change = blend(blue7, 0.15, bg)
local diff_text   = blue7

local error   = red1
local warning = yellow
local info    = blue2
local hint    = teal
local todo    = blue

local hl = vim.api.nvim_set_hl

-- Base highlights
hl(0, 'Normal',       { fg = fg, bg = bg })
hl(0, 'NormalNC',     { fg = fg, bg = bg })
hl(0, 'NormalSB',     { fg = fg_dark, bg = bg_sidebar })
hl(0, 'NormalFloat',  { fg = fg, bg = bg_float })
hl(0, 'FloatBorder',  { fg = border_highlight, bg = bg_float })
hl(0, 'FloatTitle',   { fg = border_highlight, bg = bg_float })
hl(0, 'Comment',      { fg = comment, italic = true })
hl(0, 'ColorColumn',  { bg = black })
hl(0, 'Conceal',      { fg = dark5 })
hl(0, 'Cursor',       { fg = bg, bg = fg })
hl(0, 'lCursor',      { fg = bg, bg = fg })
hl(0, 'CursorIM',     { fg = bg, bg = fg })
hl(0, 'CursorColumn', { bg = bg_highlight })
hl(0, 'CursorLine',   { bg = bg_highlight })
hl(0, 'Directory',    { fg = blue })
hl(0, 'DiffAdd',      { bg = diff_add })
hl(0, 'DiffChange',   { bg = diff_change })
hl(0, 'DiffDelete',   { bg = diff_delete })
hl(0, 'DiffText',     { bg = diff_text })
hl(0, 'EndOfBuffer',  { fg = bg })
hl(0, 'ErrorMsg',     { fg = error })
hl(0, 'VertSplit',    { fg = border })
hl(0, 'WinSeparator', { fg = border, bold = true })
hl(0, 'Folded',       { fg = blue, bg = fg_gutter })
hl(0, 'FoldColumn',   { bg = bg, fg = comment })
hl(0, 'SignColumn',   { bg = bg, fg = fg_gutter })
hl(0, 'SignColumnSB', { bg = bg_sidebar, fg = fg_gutter })
hl(0, 'Substitute',   { bg = red, fg = black })
hl(0, 'LineNr',       { fg = fg_gutter })
hl(0, 'CursorLineNr', { fg = orange, bold = true })
hl(0, 'LineNrAbove',  { fg = fg_gutter })
hl(0, 'LineNrBelow',  { fg = fg_gutter })
hl(0, 'MatchParen',   { fg = orange, bold = true })
hl(0, 'ModeMsg',      { fg = fg_dark, bold = true })
hl(0, 'MsgArea',      { fg = fg_dark })
hl(0, 'MoreMsg',      { fg = blue })
hl(0, 'NonText',      { fg = dark3 })
hl(0, 'Pmenu',        { bg = bg_popup, fg = fg })
hl(0, 'PmenuMatch',   { bg = bg_popup, fg = blue1 })
hl(0, 'PmenuSel',     { bg = blend(fg_gutter, 0.8, bg) })
hl(0, 'PmenuMatchSel', { bg = blend(fg_gutter, 0.8, bg), fg = blue1 })
hl(0, 'PmenuSbar',    { bg = blend(bg_popup, 0.95, fg) })
hl(0, 'PmenuThumb',   { bg = fg_gutter })
hl(0, 'Question',     { fg = blue })
hl(0, 'QuickFixLine', { bg = bg_visual, bold = true })
hl(0, 'Search',       { bg = bg_search, fg = fg })
hl(0, 'IncSearch',    { bg = orange, fg = black })
hl(0, 'CurSearch',    { link = 'IncSearch' })
hl(0, 'SpecialKey',   { fg = dark3 })
hl(0, 'SpellBad',     { sp = error, undercurl = true })
hl(0, 'SpellCap',     { sp = warning, undercurl = true })
hl(0, 'SpellLocal',   { sp = info, undercurl = true })
hl(0, 'SpellRare',    { sp = hint, undercurl = true })
hl(0, 'StatusLine',   { fg = fg_dark, bg = bg_statusline })
hl(0, 'StatusLineNC', { fg = fg_gutter, bg = bg_statusline })
hl(0, 'TabLine',      { bg = bg_statusline, fg = fg_gutter })
hl(0, 'TabLineFill',  { bg = black })
hl(0, 'TabLineSel',   { fg = black, bg = blue })
hl(0, 'Title',        { fg = blue, bold = true })
hl(0, 'Visual',       { bg = bg_visual })
hl(0, 'VisualNOS',    { bg = bg_visual })
hl(0, 'WarningMsg',   { fg = warning })
hl(0, 'Whitespace',   { fg = fg_gutter })
hl(0, 'WildMenu',     { bg = bg_visual })
hl(0, 'WinBar',       { link = 'StatusLine' })
hl(0, 'WinBarNC',     { link = 'StatusLineNC' })

-- Syntax
hl(0, 'Bold',       { bold = true, fg = fg })
hl(0, 'Character',  { fg = green })
hl(0, 'Constant',   { fg = orange })
hl(0, 'Debug',      { fg = orange })
hl(0, 'Delimiter',  { link = 'Special' })
hl(0, 'Error',      { fg = error })
hl(0, 'Function',   { fg = blue })
hl(0, 'Identifier', { fg = magenta })
hl(0, 'Italic',     { italic = true, fg = fg })
hl(0, 'Keyword',    { fg = '#b392f0' })
hl(0, 'Operator',   { fg = blue5 })
hl(0, 'PreProc',    { fg = cyan })
hl(0, 'Special',    { fg = blue1 })
hl(0, 'Statement',  { fg = magenta })
hl(0, 'String',     { fg = green })
hl(0, 'Todo',       { bg = yellow, fg = bg })
hl(0, 'Type',       { fg = blue1 })
hl(0, 'Underlined', { underline = true })

-- LSP
hl(0, 'LspReferenceText',            { bg = fg_gutter })
hl(0, 'LspReferenceRead',            { bg = fg_gutter })
hl(0, 'LspReferenceWrite',           { bg = fg_gutter })
hl(0, 'LspSignatureActiveParameter', { bg = blend(bg_visual, 0.4, bg), bold = true })
hl(0, 'LspCodeLens',                 { fg = comment })
hl(0, 'LspInlayHint',                { bg = blend(blue7, 0.1, bg), fg = dark3 })
hl(0, 'LspInfoBorder',               { fg = border_highlight, bg = bg_float })
hl(0, 'ComplHint',                    { fg = term_black })

-- Diagnostics
hl(0, 'DiagnosticError',            { fg = error })
hl(0, 'DiagnosticWarn',             { fg = warning })
hl(0, 'DiagnosticInfo',             { fg = info })
hl(0, 'DiagnosticHint',             { fg = hint })
hl(0, 'DiagnosticUnnecessary',      { fg = term_black })
hl(0, 'DiagnosticVirtualTextError', { bg = blend(error, 0.1, bg), fg = error })
hl(0, 'DiagnosticVirtualTextWarn',  { bg = blend(warning, 0.1, bg), fg = warning })
hl(0, 'DiagnosticVirtualTextInfo',  { bg = blend(info, 0.1, bg), fg = info })
hl(0, 'DiagnosticVirtualTextHint',  { bg = blend(hint, 0.1, bg), fg = hint })
hl(0, 'DiagnosticUnderlineError',   { undercurl = true, sp = error })
hl(0, 'DiagnosticUnderlineWarn',    { undercurl = true, sp = warning })
hl(0, 'DiagnosticUnderlineInfo',    { undercurl = true, sp = info })
hl(0, 'DiagnosticUnderlineHint',    { undercurl = true, sp = hint })

-- Health
hl(0, 'healthError',   { fg = error })
hl(0, 'healthSuccess', { fg = green1 })
hl(0, 'healthWarning', { fg = warning })

-- Diff
hl(0, 'diffAdded',    { bg = diff_add, fg = '#449dab' })
hl(0, 'diffRemoved',  { bg = diff_delete, fg = '#914c54' })
hl(0, 'diffChanged',  { bg = diff_change, fg = '#6183bb' })
hl(0, 'diffOldFile',  { fg = blue1, bg = diff_delete })
hl(0, 'diffNewFile',  { fg = blue1, bg = diff_add })
hl(0, 'diffFile',     { fg = blue })
hl(0, 'diffLine',     { fg = comment })
hl(0, 'diffIndexLine', { fg = magenta })

-- Treesitter
hl(0, '@annotation',                  { link = 'PreProc' })
hl(0, '@attribute',                   { link = 'PreProc' })
hl(0, '@boolean',                     { link = 'Boolean' })
hl(0, '@character',                   { link = 'Character' })
hl(0, '@character.printf',            { link = 'SpecialChar' })
hl(0, '@character.special',           { link = 'SpecialChar' })
hl(0, '@comment',                     { link = 'Comment' })
hl(0, '@comment.error',               { fg = error })
hl(0, '@comment.hint',                { fg = hint })
hl(0, '@comment.info',                { fg = info })
hl(0, '@comment.note',                { fg = hint })
hl(0, '@comment.todo',                { fg = todo })
hl(0, '@comment.warning',             { fg = warning })
hl(0, '@constant',                    { link = 'Constant' })
hl(0, '@constant.builtin',            { link = 'Special' })
hl(0, '@constant.macro',              { link = 'Define' })
hl(0, '@constructor',                 { fg = magenta })
hl(0, '@constructor.tsx',             { fg = blue1 })
hl(0, '@diff.delta',                  { link = 'DiffChange' })
hl(0, '@diff.minus',                  { link = 'DiffDelete' })
hl(0, '@diff.plus',                   { link = 'DiffAdd' })
hl(0, '@function',                    { link = 'Function' })
hl(0, '@function.builtin',            { link = 'Special' })
hl(0, '@function.call',               { link = '@function' })
hl(0, '@function.macro',              { link = 'Macro' })
hl(0, '@function.method',             { link = 'Function' })
hl(0, '@function.method.call',        { link = '@function.method' })
hl(0, '@keyword',                     { fg = '#b392f0' })
hl(0, '@keyword.conditional',         { link = 'Conditional' })
hl(0, '@keyword.coroutine',           { link = '@keyword' })
hl(0, '@keyword.debug',               { link = 'Debug' })
hl(0, '@keyword.directive',           { link = 'PreProc' })
hl(0, '@keyword.directive.define',    { link = 'Define' })
hl(0, '@keyword.exception',           { link = 'Exception' })
hl(0, '@keyword.function',            { fg = magenta })
hl(0, '@keyword.import',              { link = 'Include' })
hl(0, '@keyword.operator',            { link = '@operator' })
hl(0, '@keyword.repeat',              { link = 'Repeat' })
hl(0, '@keyword.return',              { link = '@keyword' })
hl(0, '@keyword.storage',             { link = 'StorageClass' })
hl(0, '@label',                       { fg = blue })
hl(0, '@markup',                      {})
hl(0, '@markup.emphasis',             { italic = true })
hl(0, '@markup.environment',          { link = 'Macro' })
hl(0, '@markup.environment.name',     { link = 'Type' })
hl(0, '@markup.heading',              { link = 'Title' })
hl(0, '@markup.italic',               { italic = true })
hl(0, '@markup.link',                 { fg = teal })
hl(0, '@markup.link.label',           { link = 'SpecialChar' })
hl(0, '@markup.link.label.symbol',    { link = 'Identifier' })
hl(0, '@markup.link.url',             { link = 'Underlined' })
hl(0, '@markup.list',                 { fg = blue5 })
hl(0, '@markup.list.checked',         { fg = green1 })
hl(0, '@markup.list.markdown',        { fg = orange, bold = true })
hl(0, '@markup.list.unchecked',       { fg = blue })
hl(0, '@markup.math',                 { link = 'Special' })
hl(0, '@markup.raw',                  { link = 'String' })
hl(0, '@markup.raw.markdown_inline',  { bg = term_black, fg = blue })
hl(0, '@markup.strikethrough',        { strikethrough = true })
hl(0, '@markup.strong',               { bold = true })
hl(0, '@markup.underline',            { underline = true })
hl(0, '@module',                      { link = 'Include' })
hl(0, '@module.builtin',              { fg = red })
hl(0, '@namespace.builtin',           { link = '@variable.builtin' })
hl(0, '@none',                        {})
hl(0, '@number',                      { link = 'Number' })
hl(0, '@number.float',                { link = 'Float' })
hl(0, '@operator',                    { fg = blue5 })
hl(0, '@property',                    { fg = green1 })
hl(0, '@punctuation.bracket',         { fg = fg_dark })
hl(0, '@punctuation.delimiter',       { fg = blue5 })
hl(0, '@punctuation.special',         { fg = blue5 })
hl(0, '@punctuation.special.markdown', { fg = orange })
hl(0, '@string',                      { link = 'String' })
hl(0, '@string.documentation',        { fg = yellow })
hl(0, '@string.escape',               { fg = magenta })
hl(0, '@string.regexp',               { fg = blue6 })
hl(0, '@tag',                         { link = 'Label' })
hl(0, '@tag.attribute',               { link = '@property' })
hl(0, '@tag.delimiter',               { link = 'Delimiter' })
hl(0, '@tag.delimiter.tsx',           { fg = blend(blue, 0.7, bg) })
hl(0, '@tag.tsx',                     { fg = red })
hl(0, '@tag.javascript',              { fg = red })
hl(0, '@type',                        { link = 'Type' })
hl(0, '@type.builtin',                { fg = blend(blue1, 0.8, bg) })
hl(0, '@type.definition',             { link = 'Typedef' })
hl(0, '@type.qualifier',              { link = '@keyword' })
hl(0, '@variable',                    { fg = fg })
hl(0, '@variable.builtin',            { fg = red })
hl(0, '@variable.member',             { fg = green1 })
hl(0, '@variable.parameter',          { fg = '#82b1d4' })
hl(0, '@variable.parameter.builtin',  { fg = blend(yellow, 0.8, fg) })

-- LSP semantic tokens
hl(0, '@lsp.type.boolean',                      { link = '@boolean' })
hl(0, '@lsp.type.builtinType',                  { link = '@type.builtin' })
hl(0, '@lsp.type.comment',                      { link = '@comment' })
hl(0, '@lsp.type.decorator',                    { link = '@attribute' })
hl(0, '@lsp.type.deriveHelper',                 { link = '@attribute' })
hl(0, '@lsp.type.enum',                         { link = '@type' })
hl(0, '@lsp.type.enumMember',                   { fg = '#82b1d4' })
hl(0, '@lsp.type.escapeSequence',               { link = '@string.escape' })
hl(0, '@lsp.type.formatSpecifier',              { link = '@markup.list' })
hl(0, '@lsp.type.generic',                      { link = '@variable' })
hl(0, '@lsp.type.interface',                    { fg = blend(blue1, 0.7, fg) })
hl(0, '@lsp.type.keyword',                      { link = '@keyword' })
hl(0, '@lsp.type.lifetime',                     { link = '@keyword.storage' })
hl(0, '@lsp.type.namespace',                    { link = '@module' })
hl(0, '@lsp.type.namespace.python',             { link = '@variable' })
hl(0, '@lsp.type.number',                       { link = '@number' })
hl(0, '@lsp.type.operator',                     { link = '@operator' })
hl(0, '@lsp.type.parameter',                    { link = '@variable.parameter' })
hl(0, '@lsp.type.property',                     { link = '@property' })
hl(0, '@lsp.type.selfKeyword',                  { link = '@variable.builtin' })
hl(0, '@lsp.type.selfTypeKeyword',              { link = '@variable.builtin' })
hl(0, '@lsp.type.string',                       { link = '@string' })
hl(0, '@lsp.type.typeAlias',                    { link = '@type.definition' })
hl(0, '@lsp.type.unresolvedReference',          { undercurl = true, sp = error })
hl(0, '@lsp.type.variable',                     {})
hl(0, '@lsp.typemod.class.defaultLibrary',      { link = '@type.builtin' })
hl(0, '@lsp.typemod.enum.defaultLibrary',       { link = '@type.builtin' })
hl(0, '@lsp.typemod.enumMember.defaultLibrary', { link = '@constant.builtin' })
hl(0, '@lsp.typemod.function.defaultLibrary',   { link = '@function.builtin' })
hl(0, '@lsp.typemod.keyword.async',             { link = '@keyword.coroutine' })
hl(0, '@lsp.typemod.keyword.injected',          { link = '@keyword' })
hl(0, '@lsp.typemod.macro.defaultLibrary',      { link = '@function.builtin' })
hl(0, '@lsp.typemod.method.defaultLibrary',     { link = '@function.builtin' })
hl(0, '@lsp.typemod.operator.injected',         { link = '@operator' })
hl(0, '@lsp.typemod.string.injected',           { link = '@string' })
hl(0, '@lsp.typemod.struct.defaultLibrary',     { link = '@type.builtin' })
hl(0, '@lsp.typemod.type.defaultLibrary',       { fg = blend(blue1, 0.8, bg) })
hl(0, '@lsp.typemod.typeAlias.defaultLibrary',  { fg = blend(blue1, 0.8, bg) })
hl(0, '@lsp.typemod.variable.callable',         { link = '@function' })
hl(0, '@lsp.typemod.variable.defaultLibrary',   { link = '@variable.builtin' })
hl(0, '@lsp.typemod.variable.injected',         { link = '@variable' })
hl(0, '@lsp.typemod.variable.static',           { link = '@constant' })

-- Plugin: gitsigns
hl(0, 'GitSignsAdd',    { fg = '#449dab' })
hl(0, 'GitSignsChange', { fg = '#6183bb' })
hl(0, 'GitSignsDelete', { fg = '#914c54' })

-- Plugin: telescope
hl(0, 'TelescopeBorder',         { fg = border_highlight, bg = bg_float })
hl(0, 'TelescopeNormal',         { fg = fg, bg = bg_float })
hl(0, 'TelescopePromptBorder',   { fg = orange, bg = bg_float })
hl(0, 'TelescopePromptTitle',    { fg = orange, bg = bg_float })
hl(0, 'TelescopeResultsComment', { fg = dark3 })

-- Plugin: bufferline
hl(0, 'BufferLineIndicatorSelected', { fg = '#6183bb' })

-- Terminal colors
vim.g.terminal_color_0  = black
vim.g.terminal_color_8  = term_black
vim.g.terminal_color_7  = fg_dark
vim.g.terminal_color_15 = fg
vim.g.terminal_color_1  = red
vim.g.terminal_color_9  = '#ff9a9e'
vim.g.terminal_color_2  = green
vim.g.terminal_color_10 = '#b5e890'
vim.g.terminal_color_3  = yellow
vim.g.terminal_color_11 = '#f0cb7e'
vim.g.terminal_color_4  = blue
vim.g.terminal_color_12 = '#9ab8ff'
vim.g.terminal_color_5  = magenta
vim.g.terminal_color_13 = '#d0b0ff'
vim.g.terminal_color_6  = cyan
vim.g.terminal_color_14 = '#98e0ff'

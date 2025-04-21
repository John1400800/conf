source $VIMRUNTIME/colors/vim.lua " Nvim: revert to Vim default color scheme
let g:colors_name = "mycolorscheme"

hi! link String Constant
hi! link Special Statement

hi! link @type.builtin Type
hi! link @keyword.import Include
hi! link @function.macro Macro
hi! link @lsp.type.macro Macro
hi! link plaintexControlSequence Type
hi! link helpSectionDelim Folded


if &background ==# 'dark'
  " Dark background
  hi NormalFloat         guifg=NONE    guibg=#303030 gui=NONE cterm=NONE
  hi DiagnosticHint      guifg=#00B7DB guibg=NONE gui=italic cterm=NONE
  hi LspInlayHint        guifg=#00B7DB guibg=NONE gui=italic cterm=NONE
  hi DiagnosticWarn      guifg=#AC00FF guibg=NONE gui=italic cterm=NONE
  hi DiagnosticUnderlineWarn                      gui=underline guisp=#AC00FF
  hi DiagnosticError     guifg=#ff0066 guibg=NONE gui=italic cterm=NONE
  hi DiagnosticUnderlineError                     gui=underline guisp=#ff0066

  hi @module      guifg=NONE    guibg=NONE    gui=italic cterm=NONE
  "hi plaintexControlSequence guifg=NONE guibg=NONE gui=italic,bold cterm=NONE

  hi Cursor       guifg=#000000 guibg=#ffffff gui=NONE cterm=NONE
  hi Normal       guifg=#ffffff guibg=NONE    gui=NONE cterm=NONE 
  hi Folded       guifg=#ff00ff guibg=#303030 gui=NONE cterm=NONE
  hi Function     guifg=NONE    guibg=NONE    gui=NONE cterm=NONE
  hi CursorLineNr guifg=#ff00ff guibg=NONE    gui=NONE cterm=NONE
  "hi QuickFixLine guifg=NONE    guibg=#FFCCFF gui=NONE cterm=NONE
  hi StatusLine   guifg=#ffffff guibg=#505050 gui=NONE cterm=NONE
  hi StatusLineNC guifg=#ffffff guibg=#303030 gui=NONE cterm=NONE
  hi StatusLineTerm       guifg=#ff00ff guibg=#303030 gui=NONE cterm=NONE
  hi StatusLineTermNC     guifg=NONE    guibg=#303030 gui=NONE cterm=NONE
  hi VertSplit    guifg=#999999 guibg=NONE gui=NONE cterm=NONE
  hi Pmenu        guifg=#ffffff guibg=#303030 gui=NONE cterm=NONE
  hi PmenuSel     guifg=#000000 guibg=#00b7db gui=NONE cterm=NONE
  hi PmenuSbar    guifg=NONE    guibg=#303030 gui=NONE cterm=NONE
  hi PmenuThumb   guifg=NONE    guibg=#00b7db gui=NONE cterm=NONE
  hi TabLine      guifg=NONE    guibg=#303030 gui=NONE cterm=NONE
  hi TabLineFill  guifg=NONE    guibg=#303030 gui=NONE cterm=NONE
  hi TabLineSel   guifg=#00b7db guibg=#303030 gui=NONE cterm=NONE
  hi NonText      guifg=#00b7db guibg=NONE    gui=NONE cterm=NONE
  hi SpecialKey   guifg=#ff00ff guibg=NONE    gui=NONE cterm=NONE
  hi Visual       guifg=#ffffff guibg=#850085 gui=NONE cterm=NONE
  hi VisualNOS            guifg=NONE guibg=#ff0066 gui=NONE cterm=NONE
  hi LineNr       guifg=#999999 guibg=NONE gui=NONE cterm=NONE
  hi FoldColumn           guifg=#AC00FF guibg=NONE gui=NONE cterm=NONE
  hi SignColumn           guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Underlined           guifg=#AC00FF guibg=NONE gui=underline cterm=underline
  hi Error        guifg=#ff0066 guibg=#000000 gui=reverse cterm=reverse
  hi ErrorMsg     guifg=#ff0066 guibg=NONE gui=NONE cterm=NONE
  hi WarningMsg   guifg=#AC00FF guibg=NONE gui=NONE cterm=NONE
  hi MoreMsg              guifg=#ffffff guibg=#000000 gui=bold cterm=bold
  hi ModeMsg      guifg=#ff00ff guibg=NONE gui=NONE cterm=NONE
  hi Question     guifg=#ff00ff guibg=NONE gui=bold cterm=bold
  hi Todo         guifg=#000000 guibg=#0000FF gui=NONE cterm=NONE
  hi MatchParen   guifg=#000000 guibg=#ff00ff gui=NONE cterm=NONE
  hi Search       guifg=#ffffff guibg=#006A78 gui=NONE cterm=NONE
  hi IncSearch    guifg=#ffffff guibg=#AC00FF gui=NONE cterm=NONE
  hi CurSearch    guifg=#ffffff guibg=#0000BB gui=NONE cterm=NONE
  hi WildMenu     guifg=#303030 guibg=#ff00ff gui=NONE cterm=NONE
  hi ColorColumn          guifg=NONE guibg=#000000 gui=NONE cterm=NONE
  hi lCursor              guifg=#ffffff guibg=#ff00ff gui=NONE cterm=NONE
  hi Comment      guifg=#0000FF guibg=NONE gui=NONE cterm=NONE
  hi Constant     guifg=#ff00ff guibg=NONE gui=NONE cterm=NONE
  hi Identifier   guifg=NONE guibg=NONE gui=NONE cterm=NONE
  hi Statement    guifg=#ff0066 guibg=NONE gui=NONE cterm=NONE
  hi PreProc      guifg=#AC00FF guibg=NONE gui=NONE cterm=NONE
  hi Type         guifg=#00b7db guibg=NONE gui=NONE cterm=NONE
  hi Tag                  guifg=#00b7db guibg=NONE gui=NONE cterm=NONE
  hi Directory    guifg=#00b7db guibg=NONE gui=bold cterm=bold
  hi Conceal              guifg=#ff0066 guibg=NONE gui=NONE cterm=NONE
  hi Ignore               guifg=#000000 guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Title        guifg=#ff00ff guibg=NONE gui=bold cterm=bold
  hi DiffAdd              guifg=#000000 guibg=#ff00ff gui=NONE cterm=NONE
  hi DiffChange           guifg=#000000 guibg=#AC00FF gui=NONE cterm=NONE
  hi DiffText             guifg=#000000 guibg=#0000FF gui=NONE cterm=NONE
  hi DiffDelete           guifg=#000000 guibg=#ff0066 gui=NONE cterm=NONE
else

  "Light background
  hi NormalFloat         guifg=NONE    guibg=#dadada gui=NONE cterm=NONE
  hi DiagnosticHint      guifg=#00B7DB guibg=NONE gui=italic cterm=NONE
  hi LspInlayHint        guifg=#00B7DB guibg=NONE gui=italic cterm=NONE
  hi DiagnosticWarn      guifg=#AC00FF guibg=NONE gui=italic cterm=NONE
  hi DiagnosticUnderlineWarn                      gui=underline guisp=#AC00FF
  hi DiagnosticError     guifg=#ff0066 guibg=NONE gui=italic cterm=NONE
  hi DiagnosticUnderlineError                     gui=underline guisp=#ff0066

  hi @module      guifg=NONE    guibg=NONE    gui=italic cterm=NONE
  "hi plaintexControlSequence guifg=NONE guibg=NONE gui=italic,bold cterm=NONE

  hi Cursor       guifg=#ffffff guibg=#000000 gui=NONE cterm=NONE
  hi Normal       guifg=#000000 guibg=NONE    gui=NONE cterm=NONE 
  hi Folded       guifg=#ff00ff guibg=#dadada gui=NONE cterm=NONE
  hi Function     guifg=NONE    guibg=NONE    gui=NONE cterm=NONE
  hi CursorLineNr guifg=#0000ff guibg=NONE    gui=NONE cterm=NONE
  "hi QuickFixLine guifg=NONE    guibg=#FFCCFF gui=NONE cterm=NONE
  hi StatusLine   guifg=#0000ff guibg=#dadada gui=NONE cterm=NONE
  hi StatusLineNC guifg=#000000 guibg=#dadada gui=NONE cterm=NONE
  hi StatusLineTerm       guifg=#ff00ff guibg=#dadada gui=NONE cterm=NONE
  hi StatusLineTermNC     guifg=NONE    guibg=#dadada gui=NONE cterm=NONE
  hi VertSplit    guifg=#000000 guibg=NONE gui=NONE cterm=NONE
  hi Pmenu        guifg=#000000 guibg=#dadada gui=NONE cterm=NONE
  hi PmenuSel     guifg=#ffffff guibg=#0000ff gui=NONE cterm=NONE
  hi PmenuSbar    guifg=NONE    guibg=#dadada gui=NONE cterm=NONE
  hi PmenuThumb   guifg=NONE    guibg=#0000ff gui=NONE cterm=NONE
  hi TabLine      guifg=NONE    guibg=#dadada gui=NONE cterm=NONE
  hi TabLineFill  guifg=NONE    guibg=#dadada gui=NONE cterm=NONE
  hi TabLineSel   guifg=#0000ff guibg=#dadada gui=NONE cterm=NONE
  hi NonText      guifg=#ffffff guibg=NONE    gui=NONE cterm=NONE
  hi SpecialKey   guifg=#ff00ff guibg=NONE    gui=NONE cterm=NONE
  hi Visual       guifg=#000000 guibg=#CCCCFF gui=NONE cterm=NONE
  hi VisualNOS            guifg=NONE guibg=#ff0066 gui=NONE cterm=NONE
  hi LineNr       guifg=#000000 guibg=NONE gui=NONE cterm=NONE
  hi FoldColumn           guifg=#AC00FF guibg=NONE gui=NONE cterm=NONE
  hi SignColumn           guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Underlined           guifg=#AC00FF guibg=NONE gui=underline cterm=underline
  hi Error        guifg=#ff0066 guibg=#ffffff gui=reverse cterm=reverse
  hi ErrorMsg     guifg=#ff0066 guibg=NONE gui=NONE cterm=NONE
  hi WarningMsg   guifg=#AC00FF guibg=NONE gui=NONE cterm=NONE
  hi MoreMsg              guifg=#000000 guibg=#ffffff gui=bold cterm=bold
  hi ModeMsg      guifg=#0000ff guibg=NONE gui=NONE cterm=NONE
  hi Question     guifg=#ff00ff guibg=NONE gui=bold cterm=bold
  hi Todo         guifg=#FFFFFF guibg=#00B7DB gui=NONE cterm=NONE
  hi MatchParen   guifg=#ffffff guibg=#ff00ff gui=NONE cterm=NONE
  hi Search       guifg=#ffffff guibg=#0000ff gui=NONE cterm=NONE
  hi IncSearch    guifg=#ffffff guibg=#AC00FF gui=NONE cterm=NONE
  hi CurSearch    guifg=#ffffff guibg=#AC00FF gui=NONE cterm=NONE
  hi WildMenu     guifg=#dadada guibg=#ff00ff gui=NONE cterm=NONE
  hi ColorColumn          guifg=NONE guibg=#ffffff gui=NONE cterm=NONE
  hi lCursor              guifg=#000000 guibg=#ff00ff gui=NONE cterm=NONE
  hi Comment      guifg=#00B7DB guibg=NONE gui=NONE cterm=NONE
  hi Constant     guifg=#ff00ff guibg=NONE gui=NONE cterm=NONE
  hi Identifier   guifg=NONE guibg=NONE gui=NONE cterm=NONE
  hi Statement    guifg=#ff0066 guibg=NONE gui=NONE cterm=NONE
  hi PreProc      guifg=#AC00FF guibg=NONE gui=NONE cterm=NONE
  hi Type         guifg=#0000ff guibg=NONE gui=NONE cterm=NONE
  hi Tag                  guifg=#0000ff guibg=NONE gui=NONE cterm=NONE
  hi Directory    guifg=#0000ff guibg=NONE gui=bold cterm=bold
  hi Conceal              guifg=#ff0066 guibg=NONE gui=NONE cterm=NONE
  hi Ignore               guifg=#ffffff guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Title        guifg=#ff00ff guibg=NONE gui=bold cterm=bold
  hi DiffAdd              guifg=#ffffff guibg=#ff00ff gui=NONE cterm=NONE
  hi DiffChange           guifg=#ffffff guibg=#AC00FF gui=NONE cterm=NONE
  hi DiffText             guifg=#ffffff guibg=#00B7DB gui=NONE cterm=NONE
  hi DiffDelete           guifg=#ffffff guibg=#ff0066 gui=NONE cterm=NONE
endif

local citylights = require("citylights.colors")

local theme = {}

theme.loadSyntax = function()
    -- LuaFormatter off
    -- Syntax highlight groups

	local syntax = {
		Type =						{ fg = citylights.purple }, -- int, long, char, etc.
		StorageClass =				{ fg = citylights.cyan }, -- static, register, volatile, etc.
		Structure =					{ fg = citylights.puple }, -- struct, union, enum, etc.
		Constant =					{ fg = citylights.yellow }, -- any constant
		String =					{ fg = citylights.green, bg = citylights.none, style= 'italic' }, -- Any string
		Character =					{ fg = citylights.orange }, -- any character constant: 'c', '\n'
		Number =					{ fg = citylights.yellow }, -- a number constant: 5
		Boolean =					{ fg = citylights.orange }, -- a boolean constant: TRUE, false
		Float =						{ fg = citylights.orange }, -- a floating point constant: 2.3e10
		Statement =					{ fg = citylights.pink }, -- any statement
		Label =						{ fg = citylights.purple }, -- case, default, etc.
		Operator =					{ fg = citylights.cyan }, -- sizeof", "+", "*", etc.
		Exception =					{ fg = citylights.cyan }, -- try, catch, throw
		PreProc =					{ fg = citylights.purple }, -- generic Preprocessor
		Include =					{ fg = citylights.blue }, -- preprocessor #include
		Define =					{ fg = citylights.pink }, -- preprocessor #define
		Macro =						{ fg = citylights.cyan }, -- same as Define
		Typedef =					{ fg = citylights.red }, -- A typedef
		PreCondit =					{ fg = citylights.cyan }, -- preprocessor #if, #else, #endif, etc.
		Special =					{ fg = citylights.red }, -- any special symbol
		SpecialChar =				{ fg = citylights.pink }, -- special character in a constant
		Tag =						{ fg = citylights.red }, -- you can use CTRL-] on this
		Delimiter =					{ fg = citylights.cyan }, -- character that needs attention like , or .
		SpecialComment =			{ fg = citylights.gray }, -- special things inside a comment
		Debug =						{ fg = citylights.red }, -- debugging statements
		Underlined =				{ fg = citylights.link, bg = citylights.none, style = 'underline' }, -- text that stands out, HTML links
		Ignore =					{ fg = citylights.disabled }, -- left blank, hidden
		Error =						{ fg = citylights.error, bg = citylights.none, style = 'bold,underline' }, -- any erroneous construct
		Todo =						{ fg = citylights.yellow, bg = citylights.none, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        htmlLink = { fg = citylights.link, style = "underline" },
        htmlH1 = { fg = citylights.cyan, style = "bold" },
        htmlH2 = { fg = citylights.red, style = "bold" },
        htmlH3 = { fg = citylights.green, style = "bold" },
        htmlH4 = { fg = citylights.yellow, style = "bold" },
        htmlH5 = { fg = citylights.purple, style = "bold" },
        markdownH1 = { fg = citylights.cyan, style = "bold" },
        markdownH2 = { fg = citylights.red, style = "bold" },
        markdownH3 = { fg = citylights.green, style = "bold" },
        markdownH1Delimiter = { fg = citylights.cyan },
        markdownH2Delimiter = { fg = citylights.red },
        markdownH3Delimiter = { fg = citylights.green },
	}

	-- Options:

	-- Italic comments
	if vim.g.citylights_italic_comments == true then
		syntax.Comment =		{fg = citylights.comments, bg = citylights.none, style = 'italic'} -- italic comments
	else
		syntax.Comment =		{fg = citylights.comments} -- normal comments
	end

	-- Italic Keywords
	if vim.g.citylights_italic_keywords == true then
		syntax.Conditional =		{fg = citylights.purple, bg = citylights.none, style = 'italic'} -- italic if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = citylights.purple, bg = citylights.none, style = 'italic'} -- italic for, do, while, etc.
		syntax.Repeat =				{fg = citylights.purple, bg = citylights.none, style = 'italic'} -- italic any other keyword
	else
		syntax.Conditional =		{fg = citylights.purple} -- normal if, then, else, endif, switch, etc.
		syntax.Keyword =			{fg = citylights.purple} -- normal for, do, while, etc.
		syntax.Repeat =				{fg = citylights.purple} -- normal any other keyword
	end

	-- Italic Function names
	if vim.g.citylights_italic_functions == true then
		syntax.Function =		{fg = citylights.blue, bg = citylights.none, style = 'italic'} -- italic funtion names
	else
		syntax.Function =		{fg = citylights.blue} -- normal function names
	end

	if vim.g.citylights_italic_variables == true then
		syntax.Identifier =		{fg = citylights.variable, bg = citylights.none, style = 'italic'}; -- any variable name
	else
		syntax.Identifier =		{fg = citylights.variable}; -- any variable name
	end

	return syntax

end


theme.loadEditor = function ()
    -- Editor highlight groups

	local editor = {
		NormalFloat =			{ fg = citylights.fg, bg = citylights.float }, -- normal text and background color for floating windows
		ColorColumn =			{ fg = citylights.none, bg = citylights.active }, --  used for the columns set with 'colorcolumn'
		Conceal =				{ fg = citylights.disabled }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor =				{ fg = citylights.cursor, bg = citylights.none, style = 'reverse' }, -- the character under the cursor
		CursorIM =				{ fg = citylights.cursor, bg = citylights.none, style = 'reverse' }, -- like Cursor, but used when in IME mode
		Directory =				{ fg = citylights.blue, bg = citylights.none }, -- directory names (and other special names in listings)
		DiffAdd =				{ fg = citylights.green, bg = citylights.none, style = 'reverse' }, -- diff mode: Added line
		DiffChange =			{ fg = citylights.blue, bg = citylights.none, style = 'reverse' }, --  diff mode: Changed line
		DiffDelete =			{ fg = citylights.red, bg = citylights.none, style = 'reverse' }, -- diff mode: Deleted line
		DiffText =				{ fg = citylights.fg, bg = citylights.none, style = 'reverse' }, -- diff mode: Changed text within a changed line
		ErrorMsg =				{ fg = citylights.error }, -- error messages
		Folded =				{ fg = citylights.disabled, bg = citylights.none, style = 'italic' }, -- line used for closed folds
		FoldColumn =			{ fg = citylights.blue }, -- 'foldcolumn'
		IncSearch =				{ fg = citylights.highlight, bg = citylights.white, style = 'reverse' }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		LineNr =				{ fg = citylights.accent }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr =			{ fg = citylights.blue }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen =			{ fg = citylights.yellow, bg = citylights.none, style = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg =				{ fg = citylights.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg =				{ fg = citylights.accent }, -- |more-prompt|
		NonText =				{ fg = citylights.disabled }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Pmenu =					{ fg = citylights.text, bg = citylights.popupbg }, -- Popup menu: normal item.
		PmenuSel =				{ fg = citylights.text, bg = citylights.active }, -- Popup menu: selected item.
		PmenuSbar =				{ fg = citylights.text, bg = citylights.contrast }, -- Popup menu: scrollbar.
		PmenuThumb =			{ fg = citylights.fg, bg = citylights.border }, -- Popup menu: Thumb of the scrollbar.
		Question =				{ fg = citylights.green }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine =			{ fg = citylights.highlight, bg = citylights.title, style = 'reverse' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		qfLineNr =				{ fg = citylights.highlight, bg = citylights.title, style = 'reverse' }, -- Line numbers for quickfix lists
		Search =				{ fg = citylights.highlight, bg = citylights.white, style = 'reverse' }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		SpecialKey =			{ fg = citylights.purple }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad =				{ fg = citylights.red, bg = citylights.none, style = 'italic,undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap =				{ fg = citylights.blue, bg = citylights.none, style = 'italic,undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal =			{ fg = citylights.cyan, bg = citylights.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare =				{ fg = citylights.purple, bg = citylights.none, style = 'italic,undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine =			{ fg = citylights.accent, bg = citylights.active }, -- status line of current window
		StatusLineNC =  		{ fg = citylights.fg, bg = citylights.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm =		{ fg = citylights.fg, bg = citylights.active }, -- status line of current terminal window
		StatusLineTermNC =		{ fg = citylights.text, bg = citylights.bg }, -- status lines of not-current terminal windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLineFill =			{ fg = citylights.fg }, -- tab pages line, where there are no labels
		TablineSel =			{ fg = citylights.bg, bg = citylights.accent }, -- tab pages line, active tab page label
		Tabline =				{ fg = citylights.fg },
		Title =					{ fg = citylights.title, bg = citylights.none, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
		Visual =				{ fg = citylights.none, bg = citylights.selection }, -- Visual mode selection
		VisualNOS =				{ fg = citylights.none, bg = citylights.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg =			{ fg = citylights.yellow }, -- warning messages
		Whitespace =			{ fg = citylights.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu =				{ fg = citylights.orange, bg = citylights.none, style = 'bold' }, -- current match in 'wildmenu' completion
		CursorColumn =			{ fg = citylights.none, bg = citylights.active }, -- Screen-column at the cursor, when 'cursorcolumn' is set.

		CursorLine =			{ fg = citylights.none, bg = citylights.cursorLineBG }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		-- ToolbarLine =			{ fg = citylights.fg, bg = citylights.bg_alt },
		-- ToolbarButton =			{ fg = citylights.fg, bg = citylights.none, style = 'bold' },
		NormalMode =			{ fg = citylights.accent, bg = citylights.none, style = 'reverse' }, -- Normal mode message in the cmdline
		InsertMode =			{ fg = citylights.green, bg = citylights.none, style = 'reverse' }, -- Insert mode message in the cmdline
		ReplacelMode =			{ fg = citylights.red, bg = citylights.none, style = 'reverse' }, -- Replace mode message in the cmdline
		VisualMode =			{ fg = citylights.purple, bg = citylights.none, style = 'reverse' }, -- Visual mode message in the cmdline
		CommandMode =			{ fg = citylights.gray, bg = citylights.none, style = 'reverse' }, -- Command mode message in the cmdline
		Warnings =				{ fg = citylights.yellow },

        healthError =           { fg = citylights.error },
        healthSuccess =         { fg = citylights.green },
        healthWarning =         { fg = citylights.yellow },

        -- Dashboard
        DashboardShortCut =                     { fg = citylights.red },
        DashboardHeader =                       { fg = citylights.comments },
        DashboardCenter =                       { fg = citylights.paleblue },
        DashboardFooter =                       { fg = citylights.orange, style = "italic" },

	}

    -- Options:

    --Set transparent background
    if vim.g.citylights_disable_background == true then
		editor.Normal =				{ fg = citylights.fg, bg = citylights.none } -- normal text and background color
		editor.SignColumn =			{ fg = citylights.fg, bg = citylights.none }
    else
		editor.Normal =				{ fg = citylights.fg, bg = citylights.bg } -- normal text and background color
		editor.SignColumn =			{ fg = citylights.fg, bg = citylights.bg }
    end

    -- Remove window split borders
    if vim.g.citylights_borders == true then
		editor.VertSplit =				{ fg = citylights.border } -- the column separating vertically split windows
    else
		editor.VertSplit =				{ fg = citylights.bg } -- the column separating vertically split windows
    end

    --Set End of Buffer lines (~)
    if vim.g.citylights_hide_eob == true then
		editor.EndOfBuffer =			{ fg = citylights.bg } -- ~ lines at the end of a buffer
    else
		editor.EndOfBuffer =			{ fg = citylights.disabled } -- ~ lines at the end of a buffer
    end

    return editor
end

theme.loadTerminal = function ()

	vim.g.terminal_color_0 = citylights.black
	vim.g.terminal_color_1 = citylights.red
	vim.g.terminal_color_2 = citylights.green
	vim.g.terminal_color_3 = citylights.yellow
	vim.g.terminal_color_4 = citylights.blue
	vim.g.terminal_color_5 = citylights.purple
	vim.g.terminal_color_6 = citylights.cyan
	vim.g.terminal_color_7 = citylights.white
	vim.g.terminal_color_8 = citylights.gray
	vim.g.terminal_color_9 = citylights.red
	vim.g.terminal_color_10 = citylights.green
	vim.g.terminal_color_11 = citylights.yellow
	vim.g.terminal_color_12 = citylights.blue
	vim.g.terminal_color_13 = citylights.purple
	vim.g.terminal_color_14 = citylights.cyan
	vim.g.terminal_color_15 = citylights.white

end

theme.loadTreeSitter = function ()
    -- TreeSitter highlight groups

    local treesitter = {
        TSAnnotation =              { fg = citylights.red }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSAttribute =               { fg = citylights.yellow }, -- (unstable) TODO: docs
        TSBoolean=                  { fg = citylights.orange }, -- For booleans.
        TSCharacter=                { fg = citylights.orange }, -- For characters.
        TSConstructor =             { fg = citylights.paleblue }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSConstant =                { fg = citylights.yellow }, -- For constants
        TSConstBuiltin =            { fg = citylights.blue }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro =              { fg = citylights.blue }, -- For constants that are defined by macros: `NULL` in C.
        TSError =                   { fg = citylights.error }, -- For syntax/parser errors.
        TSException =               { fg = citylights.red }, -- For exception related keywords.
        TSField =                   { fg = citylights.variable }, -- For fields.
        TSFloat =                   { fg = citylights.red }, -- For floats.
        TSFuncMacro =               { fg = citylights.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude =                 { fg = citylights.cyan }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel =                   { fg = citylights.red }, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace =               { fg = citylights.paleblue }, -- For identifiers referring to modules and namespaces.
        TSNumber =                  { fg = citylights.cyan }, -- For all numbers
        TSOperator =                { fg = citylights.cyan }, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter =               { fg = citylights.paleblue }, -- For parameters of a function.
        TSParameterReference=       { fg = citylights.paleblue }, -- For references to parameters of a function.
        TSProperty =                { fg = citylights.paleblue }, -- Same as `TSField`,accesing for struct members in C.
        TSPunctDelimiter =          { fg = citylights.cyan }, -- For delimiters ie: `.`
        TSPunctBracket =            { fg = citylights.cyan }, -- For brackets and parens.
        TSPunctSpecial =            { fg = citylights.cyan }, -- For special punctutation that does not fall in the catagories before.
        TSString =                  { fg = citylights.green }, -- For strings.
        TSStringRegex =             { fg = citylights.blue }, -- For regexes.
        TSStringEscape =            { fg = citylights.disabled }, -- For escape characters within a string.
        TSSymbol =                  { fg = citylights.yellow }, -- For identifiers referring to symbols or atoms.
        TSType =                    { fg = citylights.yellow }, -- For types.
        TSTypeBuiltin =             { fg = citylights.purple }, -- For builtin types.
        TSTag =                     { fg = citylights.red }, -- Tags like html tag names.
        TSTagDelimiter =            { fg = citylights.cyan }, -- Tag delimiter like `<` `>` `/`
        TSText =                    { fg = citylights.text }, -- For strings considered text in a markup language.
        TSTextReference =           { fg = citylights.yellow }, -- FIXME
        TSEmphasis =                { fg = citylights.paleblue }, -- For text to be represented with emphasis.
        TSUnderline =               { fg = citylights.fg, bg = citylights.none, style = 'underline' }, -- For text to be represented with an underline.
        TSStrike =                  { }, -- For strikethrough text.
        TSTitle =                   { fg = citylights.title, bg = citylights.none, style = 'bold' }, -- Text that is part of a title.
        TSLiteral =                 { fg = citylights.fg }, -- Literal text.
        TSURI =                     { fg = citylights.link }, -- Any URI like a link or email.
        --TSNone =                    { }, -- TODO: docs
    }

    -- Options:

    -- Italic comments
    if vim.g.citylights_italic_comments == true then
        treesitter.TSComment=                  { fg = citylights.comments , bg = citylights.none, style = 'italic' } -- For comment blocks.
    else
        treesitter.TSComment=                  { fg = citylights.comments } -- For comment blocks.
    end

    if vim.g.citylights_italic_keywords == true then
        treesitter.TSConditional =             { fg = citylights.purple, style = 'italic' } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = citylights.cyan  , style = 'italic' } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = citylights.purple, style = 'italic' } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = citylights.purple, style = 'italic' } -- For keywords used to define a fuction.
    else
        treesitter.TSConditional =             { fg = citylights.purple } -- For keywords related to conditionnals.
        treesitter.TSKeyword =                 { fg = citylights.cyan } -- For keywords that don't fall in previous categories.
        treesitter.TSRepeat =                  { fg = citylights.purple } -- For keywords related to loops.
        treesitter.TSKeywordFunction =         { fg = citylights.purple } -- For keywords used to define a fuction.
    end

    if vim.g.citylights_italic_functions == true then
        treesitter.TSFunction =                { fg = citylights.blue, style = 'italic' } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = citylights.blue, style = 'italic' } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = citylights.cyan, style = 'italic' } -- For builtin functions: `table.insert` in Lua.
    else
        treesitter.TSFunction =                { fg = citylights.blue } -- For fuction (calls and definitions).
        treesitter.TSMethod =                  { fg = citylights.blue } -- For method calls and definitions.
        treesitter.TSFuncBuiltin =             { fg = citylights.cyan } -- For builtin functions: `table.insert` in Lua.
    end

    if vim.g.citylights_italic_variables == true then
        treesitter.TSVariable =                { fg = citylights.variable, style = 'italic' } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = citylights.variable, style = 'italic' } -- Variable names that are defined by the languages, like `this` or `self`.
    else
        treesitter.TSVariable =                { fg = citylights.variable } -- Any variable name that does not have another highlight.
        treesitter.TSVariableBuiltin =         { fg = citylights.variable } -- Variable names that are defined by the languages, like `this` or `self`.
    end

    return treesitter

end

theme.loadLSP = function ()
    -- Lsp highlight groups

    local lsp = {
        LspDiagnosticsDefaultError =            { fg = citylights.error }, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError =               { fg = citylights.error }, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError =           { fg = citylights.error }, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError =        { fg = citylights.error }, -- Virtual text "Error"
        LspDiagnosticsUnderlineError =          { style = 'undercurl', sp = citylights.error }, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning =          { fg = citylights.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning =             { fg = citylights.yellow}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning =         { fg = citylights.yellow}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning =      { fg = citylights.yellow}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning =        { style = 'undercurl', sp = citylights.yellow }, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation =      { fg = citylights.paleblue }, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation =         { fg = citylights.paleblue },  -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation =     { fg = citylights.paleblue }, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation =  { fg = citylights.paleblue }, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation =    { style = 'undercurl', sp = citylights.paleblue }, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint =             { fg = citylights.purple  },  -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint =                { fg = citylights.purple  }, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint =            { fg = citylights.purple  }, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint =         { fg = citylights.purple  }, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint =           { style = 'undercurl', sp = citylights.paleblue }, -- used to underline "Hint" diagnostics.
        LspReferenceText =                      { fg = citylights.refTextFg, bg = citylights.refTextBg }, -- used for highlighting "text" references
        LspReferenceRead =                      { fg = citylights.refTextFg, bg = citylights.refTextBg }, -- used for highlighting "read" references
        LspReferenceWrite =                     { fg = citylights.refTextFg, bg = citylights.refTextBg }, -- used for highlighting "write" references
    }

    return lsp

end

theme.loadPlugins = function()
    -- Plugins highlight groups

    local plugins = {

        -- LspTrouble
        LspTroubleText =                        { fg = citylights.text },
        LspTroubleCount =                       { fg = citylights.purple, bg = citylights.active },
        LspTroubleNormal =                      { fg = citylights.fg, bg = citylights.sidebar },

		-- Nvim-Compe
		CompeDocumentation =					{ fg = citylights.text, bg = citylights.contrast },

        -- Diff
        diffAdded =                             { fg = citylights.green },
        diffRemoved =                           { fg = citylights.red },
        diffChanged =                           { fg = citylights.blue },
        diffOldFile =                           { fg = citylights.text },
        diffNewFile =                           { fg = citylights.title },
        diffFile =                              { fg = citylights.gray },
        diffLine =                              { fg = citylights.cyan },
        diffIndexLine =                         { fg = citylights.purple },

        -- Neogit
        NeogitBranch =                          { fg = citylights.paleblue },
        NeogitRemote =                          { fg = citylights.purple },
        NeogitHunkHeader =                      { fg = citylights.fg, bg = citylights.highlight },
        NeogitHunkHeaderHighlight =             { fg = citylights.blue, bg = citylights.contrast },
        NeogitDiffContextHighlight =            { fg = citylights.text, bg = citylights.contrast },
        NeogitDiffDeleteHighlight =             { fg = citylights.red },
        NeogitDiffAddHighlight =                { fg = citylights.green },

        -- GitGutter
        GitGutterAdd =                          { fg = citylights.green }, -- diff mode: Added line |diff.txt|
        GitGutterChange =                       { fg = citylights.blue }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete =                       { fg = citylights.red }, -- diff mode: Deleted line |diff.txt|

        -- GitSigns
        GitSignsAdd =                           { fg = citylights.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddNr =                         { fg = citylights.green }, -- diff mode: Added line |diff.txt|
        GitSignsAddLn =                         { fg = citylights.green }, -- diff mode: Added line |diff.txt|
        GitSignsChange =                        { fg = citylights.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr =                      { fg = citylights.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn =                      { fg = citylights.blue }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete =                        { fg = citylights.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr =                      { fg = citylights.red }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn =                      { fg = citylights.red }, -- diff mode: Deleted line |diff.txt|

        -- Telescope
        TelescopeNormal =                       { fg = citylights.fg, bg = citylights.bg },
        TelescopePromptBorder =                 { fg = citylights.cyan },
        TelescopeResultsBorder =                { fg = citylights.purple },
        TelescopePreviewBorder =                { fg = citylights.green },
        TelescopeSelectionCaret =               { fg = citylights.purple },
        TelescopeSelection =                    { fg = citylights.purple, bg = citylights.active },
        TelescopeMatching =                     { fg = citylights.cyan },

        -- NvimTree
        NvimTreeRootFolder =                    { fg = citylights.nvimTreeTxt },
        NvimTreeFolderName=                     { fg = citylights.text },
        NvimTreeFolderIcon=                     { fg = citylights.accent },
        NvimTreeEmptyFolderName=                { fg = citylights.disabled },
        NvimTreeOpenedFolderName=               { fg = citylights.accent },
        NvimTreeIndentMarker =                  { fg = citylights.border },
        NvimTreeGitDirty =                      { fg = citylights.blue },
        NvimTreeGitNew =                        { fg = citylights.green },
        NvimTreeGitStaged =                     { fg = citylights.comments },
        NvimTreeGitDeleted =                    { fg = citylights.red },
        NvimTreeOpenedFile =                    { fg = citylights.accent },
        NvimTreeImageFile =                     { fg = citylights.yellow },
        NvimTreeMarkdownFile =                  { fg = citylights.pink },
        NvimTreeExecFile =                      { fg = citylights.green },
        NvimTreeSpecialFile =                   { fg = citylights.purple , style = "underline" },
        LspDiagnosticsError =                   { fg = citylights.error },
        LspDiagnosticsWarning =                 { fg = citylights.yellow },
        LspDiagnosticsInformation =             { fg = citylights.paleblue },
        LspDiagnosticsHint =                    { fg = citylights.purple },

        -- WhichKey
        WhichKey =                              { fg = citylights.blue , style = 'bold'},
        WhichKeyGroup =                         { fg = citylights.text },
        WhichKeyDesc =                          { fg = citylights.cyan, style = 'italic' },
        WhichKeySeperator =                     { fg = citylights.accent },
        WhichKeyFloating =                      { bg = citylights.float },
        WhichKeyFloat =                         { bg = citylights.float },

        -- LspSaga
        LspFloatWinNormal =                     { fg = citylights.text, bg = citylights.bg },
        LspFloatWinBorder =                     { fg = citylights.purple },
        DiagnosticError =                       { fg = citylights.error },
        DiagnosticWarning =                     { fg = citylights.yellow },
        DiagnosticInformation =                 { fg = citylights.paleblue },
        DiagnosticHint =                        { fg = citylights.purple },
		LspSagaDiagnosticBorder =				{ fg = citylights.gray },
		LspSagaDiagnosticHeader =				{ fg = citylights.blue },
		LspSagaDiagnosticTruncateLine =			{ fg = citylights.border },
		LspLinesDiagBorder =					{ fg = citylights.contrast },
		ProviderTruncateLine =					{ fg = citylights.border },
		LspSagaShTruncateLine =					{ fg = citylights.border },
		LspSagaDocTruncateLine =				{ fg = citylights.border },
		LineDiagTruncateLine =					{ fg = citylights.border },
        LspSagaBorderTitle =                    { fg = citylights.cyan },
        LspSagaHoverBorder =                    { fg = citylights.paleblue },
        LspSagaRenameBorder =                   { fg = citylights.green },
        LspSagaDefPreviewBorder =               { fg = citylights.green },
        LspSagaCodeActionTitle =                { fg = citylights.paleblue },
        LspSagaCodeActionContent =              { fg = citylights.purple },
        LspSagaCodeActionBorder =               { fg = citylights.blue },
		LspSagaCodeActionTruncateLine =			{ fg = citylights.border },
        LspSagaSignatureHelpBorder =            { fg = citylights.pink },
        LspSagaFinderSelection =                { fg = citylights.green },
		-- LspSagaAutoPreview =					{ fg = citylights.red },
        ReferencesCount =                       { fg = citylights.purple },
        DefinitionCount =                       { fg = citylights.purple },
		DefinitionPreviewTitle =				{ fg = citylights.green },
        DefinitionIcon =                        { fg = citylights.blue },
        ReferencesIcon =                        { fg = citylights.blue },
        TargetWord =                            { fg = citylights.cyan },

        -- BufferLine
        BufferLineIndicatorSelected =           { fg = citylights.accent },
        BufferLineFill =                        { bg = citylights.bg_alt },

        -- Sneak
        Sneak =                                 { fg = citylights.bg, bg = citylights.accent },
        SneakScope =                            { bg = citylights.selection },

        -- Indent Blankline
        IndentBlanklineChar =                   { fg = citylights.indentHlDefault },
        IndentBlanklineContextChar =            { fg = citylights.indentHlContext },

        -- Nvim dap
        DapBreakpoint =                         { fg = citylights.red },
        DapStopped =                            { fg = citylights.green },

		-- Illuminate
		illuminatedWord =						{ bg = citylights.highight },
		illuminatedCurWord =					{ bg = citylights.highight },

		-- Hop
		HopNextKey = 							{ fg = citylights.orange, style = "bold" },
		HopNextKey1 = 							{ fg = citylights.blue, style = "bold" },
		HopNextKey2 = 							{ fg = citylights.blue },
		HopUnmatched = 							{ fg = citylights.comments },
    }
    -- Options:

    -- Disable nvim-tree background
        if vim.g.citylights_disable_background == true then
            plugins.NvimTreeNormal =                        { fg = citylights.comments, bg = citylights.none }
        else
            plugins.NvimTreeNormal =                        { fg = citylights.comments, bg = citylights.sidebar }
        end

    return plugins

end

-- LuaFormatter on
return theme

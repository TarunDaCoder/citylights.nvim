-- LuaFormatter off
local citylights = {
	-- Common colors
	white    =      '#b7c5d3',
	gray     =      '#262626',
	black    =      '#41505e',
	red      =      '#ee3a43',
	green    =      '#8bd49c',
	yellow   =      '#d98e48',
	blue     =      '#5ec4ff',
	paleblue =      '#539afc',
	cyan     =      '#008b94',
	purple   =      '#b62d65',
	orange   =      '#cd853f',
	pink     =      '#af005f',

	error    =      '#d95468',
	link     =      '#5ec4ff',
	cursor   =      '#5ec4ff',

	none     =      'NONE'
}

-- Style specific colors

-- Darker theme style


citylights.bg =			  '#181e24'
citylights.bg_alt =		  '#181e24'
citylights.fg =			  '#9fb2c3'
citylights.text =		  '#0d1426'
citylights.comments =	  '#3b4d57'
citylights.selection = 	  '#28323b'
citylights.contrast =	  '#9eaeba'
citylights.active =		  '#1a2938'
citylights.border =		  '#29395f'
citylights.line_numbers = '#a0b3c5'
citylights.highlight =	  '#28323b'
citylights.disabled =	  '#3d3b52'
citylights.accent =		  '#b8798b'
citylights.indentHlDefault ='#2a3557'
citylights.indentHlContext ='#5075b9'
citylights.popupbg = '#1c3042'
citylights.popupbgActive = '#293a4e'
citylights.refTextBg = '#02244d'
citylights.refTextFg = '#aacfdf'
citylights.nvimTreeTxt = '#0d1426'
citylights.cursorLineBG = citylights.active
-- Optional colors

-- LuaFormatter on

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.citylights_contrast == false then
    citylights.sidebar = citylights.bg
    citylights.float = citylights.bg
else
    citylights.sidebar = citylights.contrast
    citylights.float = citylights.bg
end

-- Enable custom variable colors
if vim.g.citylights_variable_color == nil then
    citylights.variable = citylights.paleblue
else
    citylights.variable = vim.g.citylights_variable_color
end

-- Set BG Transparent
if vim.g.citylights_transparent_bg == true then
    citylights.bg = 'NONE'
    citylights.comments = '#A7ACC9'
    citylights.cursorLineBG = 'NONE'
    citylights.line_numbers = citylights.gray
end

-- Set black titles for lighter style
citylights.title = '#476575'

-- Apply user defined colors

-- Check if vim.g.citylights_custom_colors = is a table
if type(vim.g.citylights_custom_colors) == "table" then
    -- Iterate trough the table
    for key, value in pairs(vim.g.citylights_custom_colors) do
        -- If the key doesn't exist:
        if not citylights[key] then
            error("Color " .. key .. " does not exist")
        end
        -- If it exists and the sting starts with a "#"
        if string.sub(value, 1, 1) == "#" then
            -- Hex override
            citylights[key] = value
            -- IF it doesn't, dont accept it
        else
            -- Another group
            if not citylights[value] then
                error("Color " .. value .. " does not exist")
            end
            citylights[key] = citylights[value]
        end
    end
end

return citylights

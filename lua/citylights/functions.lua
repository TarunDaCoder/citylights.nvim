local toggle_eob = function()
    if vim.g.citylights_hide_eob == nil then
        vim.g.citylights_hide_eob = true
    else
        vim.g.citylights_hide_eob = nil
    end
    vim.cmd [[colorscheme citylights]]
end

return {toggle_eob = toggle_eob}

local status_web_devicons_ok, web_devicons = pcall(require, 'nvim-web-devicons')

-- StatusBar
local colors = {
  blue   = '#89B4FA',
  cyan   = '#A6E3A1',
  black  = '#11111B',
  white  = '#CDD6F4',
  red    = '#F38BA8',
  violet = '#CBA6F7',
  grey   = '#313244',
  yellow = '#FAB387',
  lavender = '#B4BEFE'
}

local hl_winbar = "WinBarFile"
local hl_modified = "WinBarModified"
local hl_winbar_file_icon = "WinBarFileIcon"

function is_empty(s)
    return s == nil or s == ''
end

function show_winbar()
    local filename = vim.fn.expand('%:t')
    local file_type = vim.fn.expand('%:e')
    local value = ''
    local file_icon = ''

    -- Return nothing if not a file (i.e Neotree buffer)
    if is_empty(file_type) then
       return value
    end

    -- Add padding to the left
    value = ' '

    -- Get DevIcon
    if status_web_devicons_ok then
        file_icon = web_devicons.get_icon(filename, file_type, { default = default })
        hl_winbar_file_icon = "DevIcon" .. file_type
        file_icon = '%#' .. hl_winbar_file_icon .. '#' .. file_icon .. ' %*'
        value = value .. file_icon
    end

    vim.api.nvim_set_hl(0, hl_winbar, { fg = colors.lavender, bold = true })
    vim.api.nvim_set_hl(0, hl_modified, { fg = colors.yellow, bold = true })

    local value = value .. ' %#' .. hl_winbar .. '#%f' .. '%#' .. hl_modified .. '# %m%*'
    pcall(vim.api.nvim_set_option_value, 'winbar', value, { scope = 'local' })
end

-- Autocmd
vim.api.nvim_create_autocmd({ 'DirChanged', 'CursorMoved', 'BufWinEnter', 'BufFilePost', 'InsertEnter', 'BufWritePost' }, {
    callback = function()
       show_winbar()
    end
})

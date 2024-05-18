-- everforest 主题
return {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    cond = (function()
        return not vim.g.vscode
    end),
    config = function()
        vim.g.everforest_enable_italic = true
        vim.cmd.colorscheme('everforest')
    end
}

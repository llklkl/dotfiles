-- 文件树
return {
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    lazy = false,
    cond = (function()
        return not vim.g.vscode
    end),
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 30
            },
            renderer = {
                group_empty = true
            },
            filters = {
                dotfiles = true
            }
        })
    end
}

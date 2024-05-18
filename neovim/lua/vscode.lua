local utils = require("utils")
local vscode = require("vscode-neovim")

local map = utils.map

vim.notify = vscode.notify
vim.g.clipboard = vim.g.vscode_clipboard

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.virtualedit = "block"
vim.opt.jumpoptions = "stack"
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.showcmd = true
vim.cmd.syntax("off")

-- 按键映射
-- leader 是空格键
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function vscode_action(cmd)
    return function()
        vscode.action(cmd)
    end
end

-- 从插入模式切换到正常模式
map("i", "jk", "<Esc>", {
    desc = "ESC"
})

-- 缩进
map("n", ">", ">>")
map("n", "<", "<<")

-- 重定义home, end
map({"n", "v"}, "L", "g_")
map({"n", "v"}, "H", "^")

map("n", "<Leader>f", vscode_action("editor.action.formatDocument"), {
    desc = "格式化文档"
})

map("n", "gh", vscode_action("workbench.action.navigateBack"), {
    desc = "后退"
})
map("n", "gl", vscode_action("workbench.action.navigateForward"), {
    desc = "后退"
})

map("n", "gf", vscode_action("workbench.files.action.focusFilesExplorer"), {
    desc = "打开资源管理器"
})

map("n", "gi", vscode_action("editor.action.peekImplementation"), {
    desc = "跳转到实现"
})
map("n", "gI", vscode_action("editor.action.revealDefinition"), {
    desc = "跳转到定义"
})

map("n", "gr", vscode_action("editor.action.rename"), {
    desc = "重构"
})

map("n", "th", vscode_action("editor.action.showHover"), {
    desc = "显示文档"
})
map("n", "ta", vscode_action("gitlens.toggleFileBlame"), {
    desc = "git blame"
})

map("n", "zM", vscode_action("editor.foldAll"), {
    desc = "fold all"
})
map("n", "zR", vscode_action("editor.unfoldAll"), {
    desc = "unfold all"
})
map("n", "zc", vscode_action("editor.fold"), {
    desc = "fold"
})
map("n", "zC", vscode_action("editor.foldRecursively"), {
    desc = "fold recursively"
})
map("n", "zo", vscode_action("editor.unfold"), {
    desc = "unfold"
})
map("n", "zO", vscode_action("editor.unfoldRecursively"), {
    desc = "unfold recursively"
})
map("n", "za", vscode_action("editor.toggleFold"), {
    desc = "toggle fold"
})

-- Autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "Search",
            timeout = 1000
        })
    end
})

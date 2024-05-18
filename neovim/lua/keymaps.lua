local utils = require("utils")

local map = utils.map

-- leader 是空格键
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- 从插入模式切换到正常模式
map('i', 'jk', '<esc>', {
    desc = 'ESC'
})

-- 快速上下跳转
map('n', '<c-j>', '5jzz')
map('n', '<c-k>', '5kzz')

-- 缩进
map('n', '>', '>>')
map('n', '<', '<<')

-- 重定义home, end
map({'n', 'v'}, 'L', 'g_')
map({'n', 'v'}, 'H', '^')

-- 打开一个终端
map('n', '<leader>tt', '<cmd>below 10sp | term<cr>a', {
    desc = 'mini terminal'
})

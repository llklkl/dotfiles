local _M = {}

utils = _M

-- mode 支持字符串或者字符串数组
function _M.map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

return utils

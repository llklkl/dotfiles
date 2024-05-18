if vim.g.vscode then
    require("vscode")
else
    require("keymaps")
    require("options")
end

require("plugin")

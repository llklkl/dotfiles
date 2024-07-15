-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    -- 颜色主题
    {
        "sainnhe/everforest",
        config = function ()
            vim.g.everforest_transparent_background = 1
        end
    },
    -- 设置主题
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "everforest"
        }
    }
}

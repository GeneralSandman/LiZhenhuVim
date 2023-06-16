-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--
--
--
-- 李振虎的config.lua
lvim.plugins = {
    {
        -- 悬浮终端
        -- https://github.com/voldikss/vim-floaterm
        "voldikss/vim-floaterm",
        commit = "bd0aee3c861d613f56b85bd9eaffdcab459071fd",
        keys = {
            {"<F9>", "<CMD>FloatermNew<CR>", mode = "n"},
            {"<F10>", "<CMD>FloatermPrev<CR>", mode = "n"},
            {"<F11>", "<CMD>FloatermNext<CR>", mode = "n"},
            {"<F12>", "<CMD>FloatermToggle<CR>", mode = "n"},

            {"<F9>", "<C-\\><C-n>:FloatermNew<CR>", mode = "t"},
            {"<F10>", "<C-\\><C-n>:FloatermPrev<CR>", mode = "t"},
            {"<F11>", "<C-\\><C-n>:FloatermNext<CR>", mode = "t"},
            {"<F12>", "<C-\\><C-n>:FloatermToggle<CR>", mode = "t"}
        }
    }, {
        -- 调试
        -- https://github.com/puremourning/vimspector
        -- :VimspectorInstall 安装调试插件
        "puremourning/vimspector",
        version = "5265085743",
        keys = {
            {"<F1>", "<CMD>call vimspector#Continue()<CR>", mode = "n"},
            {"<F2>", "<CMD>call vimspector#ToggleBreakpoint()<CR>", mode = "n"},
            {"<F3>", "<CMD>call vimspector#Restart()<CR>", mode = "n"},
            {"<F4>", "<CMD>call vimspector#Reset()<CR>", mode = "n"},
            {"<F5>", "<CMD>call vimspector#ListBreakpoints()<CR>", mode = "n"},
            {"<F6>", "<CMD>call vimspector#ClearBreakpoints()<CR>", mode = "n"},
            -- {"<F7>", "<Plug>VimspectorBalloonEval", mode = "n"}, -- 在 Variables and scopes 窗口处 可以查看 变量名的类型 
        },
        init = function()
            vim.g.vimspector_variables_display_mode = 'full'
        end
    }
}





## 0. clone

## 1. install neovim

bash ./utils/installer/install-neovim-from-release

运行完成之后会 获取一个 neovim 的安装目录

例如：/Users/bytedance/.local/bin/nvim


## 2. 更改 ./utils/installer/install.sh 中 $LiZhenhu_NeoVim_Bin_Path  为 neovim的安装目录


## 3. install lvim

bash ./utils/installer/install.sh


## 4. 如果 运行 /Users/bytedance/.local/bin/lvim 会报错  更改 neovim的安装目录 也就是 第一步获取到的

修改 /Users/bytedance/.local/bin/lvim 中第 11行 nvim的安装目录

vim /Users/bytedance/.local/bin/lvim

exec -a "$NVIM_APPNAME" nvim -u "$LUNARVIM_BASE_DIR/init.lua" "$@"

改成

exec -a "$NVIM_APPNAME" /Users/bytedance/.local/bin/nvim -u "$LUNARVIM_BASE_DIR/init.lua" "$@"


## 5. 添加alias

vim ~/.zshrc

alias nvim="/Users/bytedance/.local/bin/nvim"
alias lvim="/Users/bytedance/.local/bin/lvim"



## 6. lvim 即可调用

------------------------------------

# 自定义配置

自定义配置 是这样的，

https://www.lunarvim.org/docs/configuration

位于 ~/.config/lvim/config.lua

!!!!!!! 记得一定要备份

是 install 过程中 把 config.example.lua 复制到 ~/.config/lvim/config.lua

快捷键 <leader>Lc  即可编辑这个 文件 ~/.config/lvim/config.lua

在这个文件里边可以放自己的插件

更改完成之后 <leader>Lr 即可重新加载配置

nvim ~/.config/lvim/config.lua  文件内容
```
-- Read the docs: https://www.lunarvim.org/docs/configuration
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



```




## 1. 删除 lunarvim  配置的快捷键，定义自己熟悉的

## 2. 自己配置的插件


### 调试插件  vimspector

自动保存 断点list

let g:vimspector_variables_display_mode="full"

### 终端弹出插件


### 禁用不想用的


终端弹出插件   toggleterm.nvim
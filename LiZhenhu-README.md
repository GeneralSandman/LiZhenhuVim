

## 0. clone

git clone https://github.com/GeneralSandman/LiZhenhuVim

cd LiZhenhuVim

## 1. install neovim

bash ./utils/installer/install-neovim-from-release

运行完成之后会 获取一个 neovim 的安装目录, 例如：/Users/bytedance/.local/bin/nvim

## 2. 更改 ./utils/installer/install.sh 

将 $LiZhenhu_NeoVim_Bin_Path  为 neovim的安装目录

LiZhenhu_NeoVim_Bin_Path="/Users/bytedance/.local/bin/nvim"

## 3. install lvim 配置

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



## 6. 输入 lvim 即可调用


## 7. 自定义配置文件的联动

本来：install 过程中 把 config.lizhenhu.lua 复制到 ~/.config/lvim/config.lua
两个配置文件 不联动，更改的时候容易丢失

这里手动用软连接链接起来

rm ~/.config/lvim/config.lua

ln -s /Users/bytedance/Desktop/LiZhenhuVim/utils/installer/config.lizhenhu.lua ~/.config/lvim/config.lua



------------------------------------


c/cpp 跳转不正确，需要生成 compile_commands.json 文件在根目录
brew install compiledb
compiledb -n make


------------------------------------

# 自定义配置

自定义配置 是这样的，

https://www.lunarvim.org/docs/configuration

位于 ~/.config/lvim/config.lua

快捷键 <leader>Lc  即可编辑这个 文件 ~/.config/lvim/config.lua
更改完成之后 <leader>Lr 即可重新加载配置



## 1. 删除 lunarvim  配置的快捷键，定义自己熟悉的

## 2. 自己配置的插件


### 调试插件  vimspector

自动保存 断点list


自动保存 session 工作区



clang-format

-- Plug vim-clang-format
-- Plug Link https://github.com/rhysd/vim-clang-format
-- 代码自动格式化
--
-- TODO: 卡顿
vim.cmd(
[[
  let g:clang_format#detect_style_file = 1
  let g:clang_format#auto_format = 0
  let g:clang_format#auto_format_on_insert_leave = 0
]])
--
-- Plug vim-clang-format end
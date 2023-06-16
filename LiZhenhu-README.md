

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

## 1. 删除 lunarvim  配置的快捷键，定义自己熟悉的

## 2. 自己配置的插件
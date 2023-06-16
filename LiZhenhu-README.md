

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


## 7. 配置文件的联动

本来：install 过程中 把 config.lizhenhu.lua 复制到 ~/.config/lvim/config.lua
两个配置文件 不联动，更改的时候容易丢失

这里用软连接链接起来

rm ~/.config/lvim/config.lua

ln -s /Users/bytedance/Desktop/LiZhenhuVim/utils/installer/config.lizhenhu.lua ~/.config/lvim/config.lua

------------------------------------

# 自定义配置

自定义配置 是这样的，

https://www.lunarvim.org/docs/configuration

位于 ~/.config/lvim/config.lua

快捷键 <leader>Lc  即可编辑这个 文件 ~/.config/lvim/config.lua
更改完成之后 <leader>Lr 即可重新加载配置


在这个文件里边可以放自己的插件

nvim ~/.config/lvim/config.lua  文件内容
```



```




## 1. 删除 lunarvim  配置的快捷键，定义自己熟悉的

## 2. 自己配置的插件


### 调试插件  vimspector

自动保存 断点list

let g:vimspector_variables_display_mode="full"

### 终端弹出插件


### 禁用不想用的


终端弹出插件   toggleterm.nvim
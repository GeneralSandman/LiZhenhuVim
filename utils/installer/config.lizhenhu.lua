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
      { "<F9>",  "<CMD>FloatermNew<CR>",           mode = "n" },
      { "<F10>", "<CMD>FloatermPrev<CR>",          mode = "n" },
      { "<F11>", "<CMD>FloatermNext<CR>",          mode = "n" },
      { "<F12>", "<CMD>FloatermToggle<CR>",        mode = "n" },
      { "<F9>",  "<C-\\><C-n>:FloatermNew<CR>",    mode = "t" },
      { "<F10>", "<C-\\><C-n>:FloatermPrev<CR>",   mode = "t" },
      { "<F11>", "<C-\\><C-n>:FloatermNext<CR>",   mode = "t" },
      { "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", mode = "t" }
    }
  }, {
  -- 调试
  -- https://github.com/puremourning/vimspector
  -- :VimspectorInstall 安装调试插件
  "puremourning/vimspector",
  version = "5265085743",
  keys = {
    { "<F1>", "<CMD>VimspectorLoadSession<CR> <CMD>call vimspector#Continue()<CR>",        mode = "n" },
    { "<F2>", "<CMD>call vimspector#ToggleBreakpoint()<CR> <CMD>VimspectorMkSession<CR>",  mode = "n" },
    { "<F3>", "<CMD>VimspectorLoadSession<CR> <CMD>call vimspector#Restart()<CR>",         mode = "n" },
    { "<F4>", "<CMD>VimspectorLoadSession<CR> <CMD>call vimspector#Reset()<CR>",           mode = "n" },
    { "<F5>", "<CMD>VimspectorLoadSession<CR> <CMD>call vimspector#ListBreakpoints()<CR>", mode = "n" },
    { "<F6>", "<CMD>call vimspector#ClearBreakpoints()<CR> <CMD>VimspectorMkSession<CR>",  mode = "n" }
    -- {"<F7>", "<Plug>VimspectorBalloonEval", mode = "n"}, -- 在 Variables and scopes 窗口处 可以查看 变量名的类型
  },
  init = function()
    vim.g.vimspector_variables_display_mode = 'full'
  end
}, {
  -- 弹窗通知
  -- https://github.com/rcarriga/nvim-notify
  -- require("notify")("My super important message")
  "rcarriga/nvim-notify",
  init = function() vim.opt.termguicolors = true end
}, {
  -- 快速打开浏览器
  -- https://github.com/tyru/open-browser.vim
  "tyru/open-browser.vim",
  lazy = false
}
}

-- 更新lunarvim 默认的的快捷键，统一在这个文件里修改
-- 不去核心配置里修改
-- 更新 lsp 的K快捷键 为H
lvim.lsp.buffer_mappings.normal_mode['K'] = nil
lvim.lsp.buffer_mappings.normal_mode['H'] = { vim.lsp.buf.hover, "Show documentation" }


-- Whick Key



local kepmap_opts = { noremap = true, silent = true }
-- zhenhuli key mappings
vim.api.nvim_set_keymap("i", "JJ", "<esc>", kepmap_opts)
vim.api.nvim_set_keymap("i", ",", ",<Space>", kepmap_opts)
vim.api.nvim_set_keymap("n", "J", "5j", kepmap_opts)
vim.api.nvim_set_keymap("n", "K", "5k", kepmap_opts)

-- 跳转
-- gd跳转进函数的定义之后 <C-t> 可跳转回去

-- Plug akinsho/bufferline.nvim
--
-- Plug Link https://github.com/akinsho/bufferline.nvim
vim.api.nvim_set_keymap("n", "R", ":BufferLineCycleNext<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "E", ":BufferLineCyclePrev<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<C-r>", ":BufferLineCycleNext<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<C-e>", ":BufferLineCyclePrev<CR>", kepmap_opts)

-- Plug telescope.nvim
-- Plug Link https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope git_files<cr>", kepmap_opts)

-- Explorer
vim.api.nvim_set_keymap("n", ";e", "<cmd>NvimTreeToggle<CR>", kepmap_opts)


-- Buffer
-- Close All Buffers inside current buffer
vim.api.nvim_set_keymap("n", "<leader>D", "<cmd>%bd|e#<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", ";D", "<cmd>%bd|e#<CR>", kepmap_opts)

-- Plug vimspector
-- 退出的时候保存断点
-- vim.api.nvim_create_autocmd({ "VimLeave" }, {
--   pattern = "*",
--   callback = function()
--     vim.cmd(":VimspectorMkSession")
--   end,
-- })


-- 快速打开浏览器
-- https://github.com/tyru/open-browser.vim
-- ob  快速在浏览器中打开
vim.api.nvim_set_keymap("n", "<leader>ob", "<Plug>(openbrowser-open)", kepmap_opts)
vim.api.nvim_set_keymap("n", ";ob", "<Plug>(openbrowser-open)", kepmap_opts)


-- 代码格式化
-- 有点慢
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.go", "*.cpp", "*.h" }


-- 自动折行
-- markdown 文件自动折行 遮掩会比较方便
-- 其余代码文件在一行显示
-- 因为 set wrap 是窗口全局
-- 所以 只有焦点在 markdown buffer 时，才 set wrap
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.md",
  callback = function()
    if vim.bo.filetype == "markdown" then
      local win = vim.api.nvim_get_current_win()
      vim.fn.setwinvar(win, "&wrap", 1)
      -- vim.cmd(":set wrap")
    end
  end,
})
-- vim.api.nvim_create_autocmd({ "BufLeave" }, {
--   pattern = "*.md",
--   callback = function()
--     if vim.bo.filetype == "markdown" then
--       vim.cmd(":set nowrap")
--     end
--   end,
-- })



-- 快速执行终端命令
-- 只用于curl吧
--
function vim.api.lizhenhu_quick_exec()
  -- 1. exec
  local command = "!" .. vim.api.nvim_get_current_line()
  local result = vim.api.nvim_exec2(command, { output = true })

  -- 2. notify
  require("notify").notify(result.output, "info", {
    title = "Quick Exec Bash",
    on_open = function(win)
      vim.fn.setwinvar(win, "&wrap", 1)
      local buf = vim.api.nvim_win_get_buf(win)
      vim.api.nvim_buf_set_option(buf, "filetype", "json")
    end,

  })

  -- 2.1 notify config
  -- 让 notify显示的信息 wrap，自动折叠
  -- local win_index = #vim.api.nvim_list_wins()
  -- vim.fn.setwinvar(win_index, "&wrap", 1)

  -- 3 save output
  -- path ~/.cache/lvim/lvim.log
  -- local Log = require "lvim.core.log"
  -- Log:info(result.output)
end

vim.api.nvim_set_keymap("n", ";qe", "<CMD>lua vim.api.lizhenhu_quick_exec()<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<F8><F8>", "<CMD>lua vim.api.lizhenhu_quick_exec()<CR>", kepmap_opts)



-- ------------------------------------------
-- 如何删除某一行而不剪切到系统粘贴板
-- 添加前缀 "_
-- e.g.   "_dd     删除当前行
-- e.g.   "_di(    删除括号里的内容
--
--
--
-- dt + 字母 # 删除所有的内容，直到遇到字母
-- di( # 删除()内的内容，不包含()
-- da( # 删除()内的内容，包含()
-- di{ # 删除{}内的内容，不包含{}
-- da{ # 删除{}内的内容，包含{}
--
-- ctrl-A  光标置与数字，增加数字
-- ctrl-X  光标置与数字，减少数字
--
--
-- :vs 横向打开
-- :sv 纵向打开
-- :undo
-- :redo
-- :only 关闭所有窗口，只保留当前窗口
--
-- % 匹配
--
--
-- i 在当前位置生前插入
-- I 在当前行首插入
--
-- a 在当前位置后插入
-- A 在当前行尾插入
--
-- o 在当前行之后插入一行
-- O 在当前行之前插入一行
--
-- p 在光标之后粘贴
-- P 在光标之前粘贴
--
-- w 向前移动一个单词（光标停在单词首部）
-- e 同w，只不过是光标停在单词尾部
-- 0（数字0）移动到本行第一个字符上，
-- $ 移动到行尾
-- gg 移动到文件头
-- G 移动到文件尾
--
--
-- x 删除当前字符
-- D 删除当前字符至行尾
--
-- gU 变大写
-- gu 变小写
-- ------------------------------------------

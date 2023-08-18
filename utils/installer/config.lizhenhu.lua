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
    { "<F1>", "<CMD>call vimspector#Continue()<CR>",         mode = "n" },
    { "<F2>", "<CMD>call vimspector#ToggleBreakpoint()<CR>", mode = "n" },
    { "<F3>", "<CMD>call vimspector#Restart()<CR>",          mode = "n" },
    { "<F4>", "<CMD>call vimspector#Reset()<CR>",            mode = "n" },
    { "<F5>", "<CMD>call vimspector#ListBreakpoints()<CR>",  mode = "n" },
    { "<F6>", "<CMD>call vimspector#ClearBreakpoints()<CR>", mode = "n" },
    { "<F7>", "<Plug>VimspectorBalloonEval<CR>",             mode = "n" }, -- 在 Variables and scopes 窗口处 可以查看 变量名的类型
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
  event = "BufEnter",
}, {
  -- 中文切换
  -- https://github.com/ybian/smartim
  "ybian/smartim",
  event = "BufEnter",
}, {
  -- https://github.com/folke/flash.nvim
  -- 快速跳转插件
  "folke/flash.nvim",
  event = "BufEnter",
  init = function()
    require('flash').setup()
  end
}
}


-- Plugin
-- 功能：
-- Link：
--


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
-- Plug Link https://github.com/akinsho/bufferline.nvim
vim.api.nvim_set_keymap("n", "R", "<CMD>BufferLineCycleNext<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "E", "<CMD>BufferLineCyclePrev<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<C-r>", "<CMD>BufferLineCycleNext<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<C-e>", "<CMD>BufferLineCyclePrev<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "X", "<CMD>BufferKill<CR>", kepmap_opts)

-- Plug telescope.nvim
-- Plug Link https://github.com/nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>Telescope git_files<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<C-f>", "<CMD>Telescope live_grep<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<C-g>", "<CMD>Telescope grep_string<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "<C-b>", "<CMD>Telescope buffers<CR>", kepmap_opts)
-- get buffers:  TeleScope buffers
--

-- Plug gitsigns.nvim
-- Plug Link https://github.com/lewis6991/gitsigns.nvim
-- 快速跳转到文件更改处
vim.api.nvim_set_keymap("n", "[c", "<CMD>Gitsigns prev_hunk<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", "]c", "<CMD>Gitsigns next_hunk<CR>", kepmap_opts)

-- Plug Explorer
-- Explorer
vim.api.nvim_set_keymap("n", ";e", "<CMD>NvimTreeToggle<CR>", kepmap_opts)


-- 书签管理器 bookmarks
-- https://github.com/tomasky/bookmarks.nvim
-- Telescope
-- require('telescope').load_extension('bookmarks')
-- 调用 :Telescope bookmarks list
-- 快速查看所有的书签
-- vim.api.nvim_set_keymap("n", "<C-m>", "<CMD>Telescope bookmarks list<CR>", kepmap_opts)
--   map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
--   map("n", "mi", bm.bookmark_ann)    -- add or edit mark annotation at current line
--   map("n", "mc", bm.bookmark_clean)  -- clean all marks in local buffer
--   map("n", "mn", bm.bookmark_next)   -- jump to next mark in local buffer
--   map("n", "mp", bm.bookmark_prev)   -- jump to previous mark in local buffer
--   map("n", "ml", bm.bookmark_list)   -- show marked file list in quickfix window


-- 中文切换
-- https://github.com/ybian/smartim
-- http://jackjin-cn.github.io/2019/2019-02-12_18-01_mac-vimzhong-wen-shu-ru-fa-de-qie-huan.html
vim.g.smartim_default = 'com.apple.keylayout.ABC'


-- Buffer
-- Close All Buffers inside current buffer
vim.api.nvim_set_keymap("n", "<leader>D", "<CMD>%bd|e#<CR>", kepmap_opts)
vim.api.nvim_set_keymap("n", ";D", "<CMD>%bd|e#<CR>", kepmap_opts)


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
lvim.format_on_save.pattern = { "*.lua", "*.py", "*.go", "*.cpp", "*.h", "*.c" }


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


vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = "*",
  callback = function()
    require("bookmarks").saveBookmarks()
  end
})


-- 快速执行终端命令
-- 只用于curl吧
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

function vim.api.lizhenhu_quick_exec_v2()
  -- 1. exec
  local command = ":FloatermNew " .. vim.api.nvim_get_current_line()
  local result = vim.api.nvim_exec2(command, { output = true })

  -- 2. notify
  require("notify").notify(result.output, "info", {
    title = "Quick Exec Bash",
  })


  vim.api.nvim_exec2(":FloatermToggle", { output = true })


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


-- https://github.com/folke/flash.nvim
-- 快速跳转插件
vim.api.nvim_set_keymap("n", "<C-/>", "<CMD>lua require('flash').jump()<CR>", kepmap_opts)

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




-- 运行 GoTest
-- go test -v -run ^TestGen code.byted.org/storage/byteElevator/pkg/clients/lark
--
--
--
--
--


-- 废弃的插件配置
--[[
{
  -- 书签管理器 bookmarks
  -- https://github.com/GeneralSandman/bookmarks.nvim
  "GeneralSandman/bookmarks.nvim",
  -- after = "telescope.nvim",
  event = "VimEnter",
  init = function()
    require('bookmarks').setup({
      -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
      -- lizhenhu feature: save_file.<workspace>
      keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function(bufnr)
        local bm = require "bookmarks"
        local map = vim.keymap.set
        map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
        map("n", "mi", bm.bookmark_ann)    -- add or edit mark annotation at current line
        map("n", "mc", bm.bookmark_clean)  -- clean all marks in local buffer
        map("n", "mn", bm.bookmark_next)   -- jump to next mark in local buffer
        map("n", "mp", bm.bookmark_prev)   -- jump to previous mark in local buffer
        map("n", "ml", bm.bookmark_list)   -- show marked file list in quickfix window
      end
    })

    require('telescope').load_extension('bookmarks')
  end

},
--]]

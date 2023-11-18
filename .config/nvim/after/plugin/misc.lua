local Remap = require("nycrat.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local silent = { silent = true }

require("lualine").setup({
  options = {
    theme = 'gruvbox',
  },
  --sections = {
    --lualine_x = {
      --{
        --require("noice").api.statusline.mode.get,
        --cond = require("noice").api.statusline.mode.has,
        --color = { fg = "#fe6142" },
      --},
      --"filetype",
    --},
  --},
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "java", "python", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,

  context_commentstring = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  indent = {
    enable = false,
    -- disable = { "cpp", "typescript", "typescriptreact", "rust" },
  },
})

require("nvim-autopairs").setup()
require("nvim-surround").setup()
require("cloak").setup()
require("ccc").setup()
require("harpoon").setup()

vim.g["mkdp_markdown_css"] = vim.fn.expand("~/.config/nvim/md.css")
vim.g["mkdp_theme"] = "light"

local spectre = require("spectre")
local harpoon_ui = require("harpoon.ui")
spectre.setup()

-- keymaps
nnoremap("<leader>s", spectre.open)
vnoremap("<leader>s", spectre.open_visual)
nnoremap("<leader>u", "<Cmd>UndotreeToggle<CR>", silent)
nnoremap("<leader>gg", "<Cmd>LazyGit<CR>", silent)
nnoremap("<leader>co", "<Cmd>CccPick<CR>", silent)
nnoremap("<leader>cc", "<Cmd>CccHighlighterToggle<CR>", silent)
nnoremap("<leader>cv", "<Cmd>CccConvert<CR>", silent)
nnoremap("<leader>h", require("harpoon.mark").add_file, silent)
nnoremap("<leader>th", harpoon_ui.toggle_quick_menu, silent)
nnoremap("<leader>oo", "<Cmd>TodoClose<CR>", silent)
nnoremap("<leader>ol", "<Cmd>TodoOpenFileList<CR>", silent)

-- CMake Keymaps
vim.api.nvim_set_keymap('', '<leader>cmg', ':CMakeGenerate<cr>', {})
vim.api.nvim_set_keymap('', '<leader>cmb', ':CMakeBuild<cr>', {})
vim.api.nvim_set_keymap('', '<leader>cmq', ':CMakeClose<cr>', {})
vim.api.nvim_set_keymap('', '<leader>cmc', ':CMakeClean<cr>', {})

-- Harpoon Marks
for i = 1, 10 do
  nnoremap("<leader>" .. i % 10, function() harpoon_ui.nav_file(i) end, silent)
  nnoremap("<leader>o" .. i % 10, "<Cmd>TodoOpenIndex " .. i .. "<CR>", silent)
end

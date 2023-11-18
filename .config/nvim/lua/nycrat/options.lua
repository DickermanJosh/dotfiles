local options = {
  autoindent = true,
  smartindent = true,
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  showtabline = 0,
  showmatch = true,

  number = true,
  relativenumber = true,
  numberwidth = 4,
  incsearch = true,
  hlsearch = false,
  ignorecase = true,
  smartcase = true,

  splitbelow = true,
  splitright = true,

  termguicolors = true,
  hidden = true,
  signcolumn = "yes",
  showmode = false,
  errorbells = false,
  wrap = false,
  cursorline = true,
  fileencoding = "utf-8",

  backup = false,
  writebackup = false,
  swapfile = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,

  colorcolumn = "0",
  updatetime = 20,
  scrolloff = 15,
  mouse = "a",
  --guicursor = "a:block",
  title = true,
  -- titlestring = "%t - Wvim",
  titlestring = "Neovim - %t",
  guifont = "MesloLGS NF:h18",
  -- clipboard = "unnamedplus",
}
-- vim.opt.nrformats:append("alpha") -- increment letters
vim.opt.shortmess:append("IsF")

-- vim.o.shortmess = "filnxstToOFS"

-- Set Highlight Groups
vim.api.nvim_command('highlight Cursor guibg=#FFA500 ctermbg=208')
vim.api.nvim_command('highlight iCursor guibg=#FFA500 ctermbg=208')
vim.api.nvim_command('highlight rCursor guibg=#FFA500 ctermbg=208')

-- Set Cursor Properties
vim.o.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver100-iCursor,r-cr:block-rCursor,o:hor50-Cursor/lCursor,sm:block-iCursor,a:blinkwait1000-blinkon500-blinkoff250'


for option, value in pairs(options) do
  vim.opt[option] = value
end

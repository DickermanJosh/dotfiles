require('code_runner').setup({
  filetype = {
    cpp = {
        "cd $dir &&",
        "clang++ -std=c++17 -o $fileNameWithoutExt $file &&",
        "./$fileNameWithoutExt"
    },
    c = {
        "cd $dir &&",
        "clang -o $fileNameWithoutExt $file &&",
        "./$fileNameWithoutExt"
    },
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    html = {
        "cd $dir &&",
        "open $fileName"
    },
  },
})

vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })



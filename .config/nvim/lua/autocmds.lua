require "nvchad.autocmds"

-- Enable spell checking for git commit messages
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Enable spell checking for git rebase
vim.api.nvim_create_autocmd("FileType", {
  pattern = "git_rebase",
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Load NvChad defaults first
require "nvchad.mappings"
local map = vim.keymap.set

-----------------------------------------------------------
-- INSERT MODE MOVEMENT
-----------------------------------------------------------
map("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
map("i", "<C-e>", "<End>", { desc = "end of line" })

-- Use Alt instead for insert mode navigation:
map("i", "<A-h>", "<Left>", { desc = "move left" })
map("i", "<A-l>", "<Right>", { desc = "move right" })
map("i", "<A-j>", "<Down>", { desc = "move down" })
map("i", "<A-k>", "<Up>", { desc = "move up" })

-----------------------------------------------------------
-- TMUX NAVIGATOR - Manual mappings
-----------------------------------------------------------
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "tmux left", silent = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "tmux down", silent = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "tmux up", silent = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "tmux right", silent = true })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "tmux previous", silent = true })

-----------------------------------------------------------
-- WINDOW RESIZING
-----------------------------------------------------------
map("n", "<S-Left>", ":vertical resize -5<CR>", { desc = "resize left" })
map("n", "<S-Right>", ":vertical resize +5<CR>", { desc = "resize right" })
map("n", "<S-Down>", ":resize +5<CR>", { desc = "resize taller" })
map("n", "<S-Up>", ":resize -5<CR>", { desc = "resize shorter" })

-----------------------------------------------------------
-- GENERAL
-----------------------------------------------------------
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "clear search" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "copy file" })
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle numbers" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative numbers" })

-----------------------------------------------------------
-- LSP
-----------------------------------------------------------
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>ds", vim.diagnostic.setloclist)

-----------------------------------------------------------
-- FORMATTING
-----------------------------------------------------------
map({ "n", "x" }, "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "format" })

-----------------------------------------------------------
-- NVIMTREE
-----------------------------------------------------------
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")

-----------------------------------------------------------
-- TELESCOPE
-----------------------------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>")

-----------------------------------------------------------
-- DIFFVIEW (simple toggle)
-----------------------------------------------------------
-- Toggle diff view (smartly closes if open, opens if closed)
map("n", "<leader>gd", function()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd "DiffviewClose"
  else
    vim.cmd "DiffviewOpen"
  end
end, { desc = "toggle diff view" })

-- Toggle file history for current file
map("n", "<leader>gh", function()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd "DiffviewClose"
  else
    vim.cmd "DiffviewFileHistory %"
  end
end, { desc = "toggle file history" })

-- Toggle entire branch history
map("n", "<leader>gH", function()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd "DiffviewClose"
  else
    vim.cmd "DiffviewFileHistory"
  end
end, { desc = "toggle branch history" })

-----------------------------------------------------------
-- TERMINALS (NvChad)
-----------------------------------------------------------
map("t", "<C-x>", "<C-\\><C-N>", { desc = "exit terminal" })

-- New terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end)

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end)

-- Toggle terminals
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "toggle vertical terminal" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "toggle floating terminal" })

-----------------------------------------------------------
-- WHICH KEY
-----------------------------------------------------------
map("n", "<leader>wK", "<cmd>WhichKey<CR>")
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end)

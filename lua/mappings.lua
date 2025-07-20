require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Open floating terminal with lazygit
map("n", "<leader>lg", function()
  local term_buf = vim.g.__lazygit_term_buf
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- If already open, close it
    vim.api.nvim_buf_delete(term_buf, { force = true })
    vim.g.__lazygit_term_buf = nil
  else
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
    })
    vim.fn.termopen("lazygit", { on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end })
    vim.g.__lazygit_term_buf = buf
    vim.api.nvim_buf_set_keymap(buf, 't', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })
  end
end, { desc = "Toggle floating lazygit" })

map("n", "<leader>ch", "<cmd>CopilotChat<CR>", { desc = "Open Copilot chat" })
map("n", "gnh", ":Gitsigns next_hunk<CR>", { desc = "Go to next git hunk" })
map("n", "grh", ":Gitsigns reset_hunk<CR>", { desc = "Reset git hunk" })


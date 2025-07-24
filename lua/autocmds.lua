require "nvchad.autocmds"

-- Automatically change the working directory to the current buffer's file directory
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local filepath = vim.api.nvim_buf_get_name(0)
    if filepath ~= "" then
      local dir = vim.fn.fnamemodify(filepath, ":p:h")
      if vim.loop.fs_stat(dir) then -- ✅ only if directory exists
        vim.cmd("lcd " .. dir) -- use "cd" instead of "lcd" for global dir change
      end
    end
  end,
})

-- Auto-remove trailing whitespace and tabs on file save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- Specific options just for lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Autocommands to toggle smear cursor effect on entering/exiting cmdline or search modes
vim.api.nvim_create_autocmd({"CmdlineEnter", "CmdlineLeave"}, {
  callback = function()
    local mode = vim.fn.mode()
    -- Disable smear effect when entering cmdline or search modes
    if mode == "c" or mode == "/" or mode == "?" then
      -- Disable smear effect in cmdline or search mode
      vim.cmd("SmearCursorToggle")
    else
      -- Re-enable smear effect in other modes
      vim.cmd("SmearCursorToggle")
    end
  end,
})

vim.cmd "colorscheme default"

local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("The colorscheme " .. colorscheme .. " is not found!")
  return
end

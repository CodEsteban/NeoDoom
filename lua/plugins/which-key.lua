local ui = require("harpoon.ui")
local wk = require("which-key")
local tlscope = require("plugins/tlscope")
local M = {}
local mark = require("harpoon.mark")
M.prompt_new_file = function()
	local file_name = vim.fn.input("File: ", "")
	vim.cmd(string.format("e %s", file_name))
end

M.delete_this_file = function()
	local file_name = vim.fn.input("Delete this file? (y/n): ", "")
	if file_name == "y" then
		vim.cmd("!rm %")
	end
end
function isBlank(x)
  return not tostring(x):find("^%s*$")
end

M.move_this_file = function()
	local folder_path = vim.api.nvim_eval("expand('%:p:h')")
	local old_file_path = vim.api.nvim_eval("expand('%:p')")
	local input_file_name = vim.fn.input(string.format("Move to (%s): ", old_file_path), "")
	local new_file_path = string.format("%s/%s",folder_path, input_file_name )
	if isBlank(input_file_name) then

		vim.cmd("messages clear")
		vim.cmd(string.format("!mv %s %s", old_file_path, new_file_path))
		vim.cmd(string.format("e %s",new_file_path))
		vim.cmd("messages clear")
	end
end
wk.register({
  ["1"] = {"<cmd>lua require('harpoon.ui').nav_file(1)<cr>","which_key_ignore" },
  ["2"] = {"<cmd>lua require('harpoon.ui').nav_file(2)<cr>","which_key_ignore" },
  ["3"] = {"<cmd>lua require('harpoon.ui').nav_file(3)<cr>","which_key_ignore" },
  ["4"] = {"<cmd>lua require('harpoon.ui').nav_file(4)<cr>","which_key_ignore" },
  ["5"] = {"<cmd>lua require('harpoon.ui').nav_file(5)<cr>","which_key_ignore" },
  ["6"] = {"<cmd>lua require('harpoon.ui').nav_file(6)<cr>","which_key_ignore" },
  ["7"] = {"<cmd>lua require('harpoon.ui').nav_file(7)<cr>","which_key_ignore" },
  ["8"] = {"<cmd>lua require('harpoon.ui').nav_file(8)<cr>","which_key_ignore" },
  ["9"] = {"<cmd>lua require('harpoon.ui').nav_file(9)<cr>","which_key_ignore" },
  ["0"] = {"<cmd>lua require('harpoon.ui').nav_file(0)<cr>","which_key_ignore" },
  ["#"] = {"<cmd>echo 'replace the # with harpoons file number'<cr>","Go to file #" },
  w = {
	  name = "Window",
	  q = {"<cmd> q <cr>", "Quit"},
	  ["?"] = {"hjkl/HJKL(go/move) window"},
	  h = {"<cmd> wincmd h<cr>", "which_key_ignore"},
	  j = {"<cmd> wincmd j<cr>", "which_key_ignore"},
	  k = {"<cmd> wincmd k<cr>", "which_key_ignore"},
	  l = {"<cmd> wincmd l<cr>", "which_key_ignore"},
	  H = {"<cmd> wincmd H<cr>", "which_key_ignore"},
	  J = {"<cmd> wincmd J<cr>", "which_key_ignore"},
	  K = {"<cmd> wincmd K<cr>", "which_key_ignore"},
	  L = {"<cmd> wincmd L<cr>", "which_key_ignore"},
	  Q = {"<cmd> q! <cr>", "Quit once for all!"},
	  n = {name = "New",
		l = {"<cmd> vs <cr>", "Left"},
		j = {"<cmd> sp <cr>","Down"},
	  }
  },
  p = {
	  name = "Project",
	  m = {mark.add_file, "Mark file"},
	  e = {"<cmd> TroubleToggle<cr>", "Errors"}
  },
  e = {
	  name = "Editor",
	  r = {"<cmd>so ~/.config/nvim/init.lua<cr>","Reload config"},
  },
  o = {
	"<cmd>ToggleTerm<cr>", "Open Terminal"
  },
  f = {
    name = "File",

    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
    m = {M.move_this_file, "Move this file"},
    n = { M.prompt_new_file,"New file" },
    d = { M.delete_this_file, "Delete this file" },
    s = { "<cmd>w<cr>", "Save file"}
  },
  [" "] = {ui.toggle_quick_menu, "Project Files"},
  ["."] = {"<cmd>Telescope file_browser path=%:p:h <cr>", "Find Here" },
  [","] = {tlscope.buffers,"Buffer"}
}, { prefix = "<leader>" } )


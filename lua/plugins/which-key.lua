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
  ["1"] = {"<cmd>lua require('harpoon.ui').nav_file(1)<cr>","File 1" },
  ["2"] = {"<cmd>lua require('harpoon.ui').nav_file(2)<cr>","File 2" },
  ["3"] = {"<cmd>lua require('harpoon.ui').nav_file(3)<cr>","File 3" },
  ["4"] = {"<cmd>lua require('harpoon.ui').nav_file(4)<cr>","File 4" },
  w = {
	  name = "Window",
	  q = {"<cmd> q <cr>", "Quit"},
	  j = {"<cmd> wincmd j<cr>", "Go down"},
	  k = {"<cmd> wincmd k<cr>", "Go up"},
	  h = {"<cmd> wincmd h<cr>", "Go left"},
	  l = {"<cmd> wincmd l<cr>", "Go right"},
	  Q = {"<cmd> q! <cr>", "Quit once for all!"},
	  n = {name = "New",
		l = {"<cmd> vs <cr>", "Left"},
		j = {"<cmd> sp <cr>","Down"},
	  }
  },
  p = {
	  name = "Project",
	  m = {mark.add_file, "mark file"},
	  e = {"<cmd> TroubleToggle<cr>", "Errors"}
  },
  e = {
	  name = "Editor",
	  r = {"<cmd>so ~/.config/nvim/init.lua<cr>","Reload config"},
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


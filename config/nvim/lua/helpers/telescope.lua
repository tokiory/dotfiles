M = {}
local telescope = require("telescope.builtin")
M.open_file = function ()
	local path = vim.loop.cwd() .. "/.git"
	local ok, _ = vim.loop.fs_stat(path)
	if ok then
		telescope.git_files()
	else
		telescope.find_files()
	end
end
return M


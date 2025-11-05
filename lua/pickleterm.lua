local M = {}

M.setup = function(opts)

end

M.terminals = {
	default = {}
}

local term_buffer_exists = function(name)
	if M.terminals[name] == nil then
		return false
	elseif M.terminals[name].buf_nr == nil then
		return false
	end
	return true
end

M.new = function(name) 
	name = name or "default"
	buf_name = "term://"..name
	vim.cmd.term()
	vim.api.nvim_buf_set_name(0, buf_name)
	buf_nr = vim.api.nvim_win_get_buf(0)
	M.terminals[name] = {
		buf_nr = buf_nr,
		buf_name = buf_name
	}
	vim.print("created new term "..buf_name)
end

M.open = function(name) 
	if not term_buffer_exists(name) then 
		M.new(name)
	end
	buf_nr = M.terminals[name].buf_nr
	vim.api.nvim_win_set_buf(0, buf_nr)
end

return M

local M = {}

M.terminals = {}

M.setup = function(opts)
	M.terminals = vim.tbl_extend("force", M.terminals, opts)
end

local term_buffer_exists = function(name)
	if M.terminals[name] == nil then
		return false
	elseif M.terminals[name].buf_nr == nil then
		return false
	end
	return true
end

M.new = function(name, start_cmd)
	name = name or "default"
	M.terminals[name] = M.terminals[name] or {}
	local buf_name = "term://" .. name
	M.terminals[name].buf_name = buf_name
	start_cmd = start_cmd or M.terminals[name].start_cmd
	if start_cmd == nil then
		vim.cmd.term()
	else
		vim.cmd.term(start_cmd)
	end
	vim.api.nvim_buf_set_name(0, buf_name)
	local buf_nr = vim.api.nvim_win_get_buf(0)
	M.terminals[name].buf_nr = buf_nr
end

M.open = function(name, start_cmd)
	name = name or "default"
	if not term_buffer_exists(name) then
		M.new(name, start_cmd)
	end
	local buf_nr = M.terminals[name].buf_nr
	vim.api.nvim_win_set_buf(0, buf_nr)
end

M.send_cmd = function(name, cmd)
	name = name or "default"
	M.open(name)
	buf_nr = M.terminals[name].buf_nr
  local chan_id = vim.b[buf_nr].terminal_job_id
  if not chan_id then
    print("Buffer " .. buf_nr .. " is not a terminal.")
    return
  end
  vim.api.nvim_chan_send(chan_id, cmd .. "\n")
end

return M

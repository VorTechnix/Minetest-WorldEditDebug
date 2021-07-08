function worldeditdebug.benchmark(code, rep)
	local func, err = loadstring(code)
	if not func then return false, err end -- Syntax error
	if not rep then rep = 1 end
	
	local good, err
	local time = {worldeditdebug.get_ms_time()}
	for i=0,rep do
		good, err= pcall(func)
	end
	time[2] = worldeditdebug.get_ms_time()
	if not good then return false, err end -- Runtime error
	return true, "Executed code " .. rep .. " times in " .. worldeditdebug.humanize_time(time[2]-time[1])
end

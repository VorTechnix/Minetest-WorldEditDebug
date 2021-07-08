function worldeditdebug.log(str)
	local path = minetest.get_worldpath() .. "/debug"
	-- Create directory if it does not already exist
	minetest.mkdir(path)
	local writer, err = io.open(path.."/wed_debug.log", "ab")
	if not writer then return false, "Could not save file to \"wed_debug.log\"" end
	writer:write(os.date("%c") .. ": " .. (type(str) == "string" and str.."\n" or "Logger error: no string passed\n"))
	writer:flush()
	writer:close()
	return type(str) == "string", type(str) == "string" and str or "Logger error: no string passed"
	-- Returns true/false, string
end

--- Tests:
-- /lua worldeditdebug.log("This is a test")
-- //log This is a test

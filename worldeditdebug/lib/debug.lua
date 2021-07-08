-- register: register debugging variable(s).
--
-- Parameters:
-- tabl (table|string) - variable(s) to register.
--
-- Returns: bool (success)
function worldeditdebug.register(tabl)
	if type(tabl) == "table" then
		for k,v in pairs(tabl) do
			worldeditdebug.debug[v] = {}
		end
		return true
	elseif type(tabl) == "string" then
		worldeditdebug.debug[tabl] = {}
		return true
	else return false end
end

-- unregister: unregister debugging variable(s).
--
-- Parameters:
-- tabl (table|string) - variable(s) to unregister.
--
-- Returns: bool (success)
function worldeditdebug.unregister(tabl)
	if type(tabl) == "table" then
		for k,v in pairs(tabl) do
			worldeditdebug.debug[v] = nil
		end
		return true
	elseif type(tabl) == "string" then
		worldeditdebug.debug[tabl] = nil
		return true
	else return false end
end

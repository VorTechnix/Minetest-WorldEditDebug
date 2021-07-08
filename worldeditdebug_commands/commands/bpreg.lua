-- ██████  ██████  ██████  ███████  ██████
-- ██   ██ ██   ██ ██   ██ ██      ██
-- ██████  ██████  ██████  █████   ██   ███
-- ██   ██ ██      ██   ██ ██      ██    ██
-- ██████  ██      ██   ██ ███████  ██████
local wed = worldeditdebug
worldedit.register_command("bpreg", {
	-- If not on or off then get (return state)
	params = "<string> [(un)register]",
	description = "(Un)Register break points for //debug.",
	privs = {debug=true,worldedit=true},
	require_pos = 0,
	parse = function(params_text)
		local p = wed.split(params_text, " ")
		if p[2] then
			if p[2] == "register" then
				p[2] = nil
			elseif p[2] ~= "unregister" then
				return false, "Error: Unknown argument \""..p[2].."\". Expected \"<string> [(un)register]\""
			end
		end
		return true, p[1], p[2]
	end,
	func = function(name, switch, act)
		local s
		if act then
			s = wed.unregister(switch)
			return s, "WorldEditDebug: break point \""..switch.."\" "..(s and "was" or "was not").." successfully unregistered"
		else
			s = wed.register(switch)
			return s, "WorldEditDebug: break point \""..switch.."\" "..(s and "was" or "was not").." successfully registered"
		end
	end,
})

--- Usage:
-- //multi //debug <string> //<other command> <params>

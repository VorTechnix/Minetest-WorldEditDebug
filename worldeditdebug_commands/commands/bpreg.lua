-- ██████  ██████  ██████  ███████  ██████
-- ██   ██ ██   ██ ██   ██ ██      ██
-- ██████  ██████  ██████  █████   ██   ███
-- ██   ██ ██      ██   ██ ██      ██    ██
-- ██████  ██      ██   ██ ███████  ██████
local wed = worldeditdebug
worldedit.register_command("bpreg", {
	-- If not on or off then get (return state)
	params = "<string> [unregister]",
	description = "(Un)Register break points for //debug.",
	privs = {debug=true,worldedit=true},
	require_pos = 0,
	parse = function(params_text)
		p = wed.split(params_text, " ")
		return true, p[1], #p > 1 and p[#p] or nil
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

-- ██████  ███████ ██████  ██    ██  ██████
-- ██   ██ ██      ██   ██ ██    ██ ██
-- ██   ██ █████   ██████  ██    ██ ██   ███
-- ██   ██ ██      ██   ██ ██    ██ ██    ██
-- ██████  ███████ ██████   ██████   ██████
local wed = worldeditdebug
worldedit.register_command("debug", {
	-- If not on or off then get (return state)
	params = "<string> [on|off]",
	description = "Set debugging state of a break point.",
	privs = {debug=true,worldedit=true},
	require_pos = 0,
	parse = function(params_text)
		local p = wed.split(params_text, " ")
		local modeSet = {on=true,off=true}
		if p[2] and not modeSet[p[2]] then
			return false, "Error: Unknown argument \""..p[2].."\". Expected \"<string> [on|off]\""
		else
			if not p[2] or p[2] == "on" then p[2] = true
			else p[2] = false end
		end
		return true, p[1], p[2]
	end,
	func = function(name, switch, state)
		if not wed.debug[switch] then
			return false, "WorldEditDebug: break point \""..switch.."\" is not registered"
		end
		wed.debug[switch][name] = state
		
		return true, "WorldEditDebug: break point \""..switch.."\" is set to \""..state.."\" for "..name
	end,
})

--- Usage:
-- //multi //debug <string> //<other command> <params>
-- //multi //bpreg wasdf //debug wasdf on

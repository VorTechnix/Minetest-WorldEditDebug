-- ██████  ███████ ███    ██  ██████ ██   ██ ███    ███  █████  ██████  ██   ██
-- ██   ██ ██      ████   ██ ██      ██   ██ ████  ████ ██   ██ ██   ██ ██  ██
-- ██████  █████   ██ ██  ██ ██      ███████ ██ ████ ██ ███████ ██████  █████
-- ██   ██ ██      ██  ██ ██ ██      ██   ██ ██  ██  ██ ██   ██ ██   ██ ██  ██
-- ██████  ███████ ██   ████  ██████ ██   ██ ██      ██ ██   ██ ██   ██ ██   ██
local wed = worldeditdebug
worldedit.register_command("benchmark", {
	params = "[<reps>] <code>",
	description = "Runs input code 1 or more times and returns the time it took.",
	privs = {debug=true,worldedit=true},
	require_pos = 0,
	parse = function(params_text)
		local _1, _2, reps, code = params_text:find("(%d*)%s?(.*)")
		return true, reps, code
	end,
	func = function(name, reps, code)
		return wed.benchmark(code, tonumber(reps))
	end,
})

-- worldeditdebug.xlate_dir("singleplayer","right")

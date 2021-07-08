-- ██       ██████   ██████
-- ██      ██    ██ ██
-- ██      ██    ██ ██   ███
-- ██      ██    ██ ██    ██
-- ███████  ██████   ██████
local wed = worldeditdebug
worldedit.register_command("log", {
	params = "<text>",
	description = "Writes input to log file",
	privs = {debug=true,worldedit=true},
	require_pos = 0,
	parse = function(params_text)
		return true, params_text
	end,
	func = function(name, params_text)
		return wed.log(params_text)
	end,
})

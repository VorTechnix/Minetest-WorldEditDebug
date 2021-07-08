-- ██████  ███████ ███    ██  ██████ ██   ██ ██       ██████   ██████
-- ██   ██ ██      ████   ██ ██      ██   ██ ██      ██    ██ ██
-- ██████  █████   ██ ██  ██ ██      ███████ ██      ██    ██ ██   ███
-- ██   ██ ██      ██  ██ ██ ██      ██   ██ ██      ██    ██ ██    ██
-- ██████  ███████ ██   ████  ██████ ██   ██ ███████  ██████   ██████
local wed = worldeditdebug
worldedit.register_command("benchlog", {
	params = "<reps> <code>",
	description = "Runs input code 1 or more times and logs the time it took.",
	privs = {debug=true,worldedit=true},
	require_pos = 0,
	parse = function(params_text)
		local _1, _2, reps, code = params_text:find("(%d*)%s?(.*)")
		return true, reps, code
	end,
	func = function(name, reps, code)
		local _, result = wed.benchmark(code, tonumber(reps))
		wed.log(result)
		return true, "Benchmark complete. Saved result to <worldname>/debug/wed_debug.log"
	end,
})

-- worldeditdebug.xlate_dir("singleplayer","right")

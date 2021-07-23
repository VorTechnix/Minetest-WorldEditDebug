-- ██████   ██████  ███████ ██████  ██    ██ ███    ███ ██████
-- ██   ██ ██    ██ ██      ██   ██ ██    ██ ████  ████ ██   ██
-- ██████  ██    ██ ███████ ██   ██ ██    ██ ██ ████ ██ ██████
-- ██      ██    ██      ██ ██   ██ ██    ██ ██  ██  ██ ██
-- ██       ██████  ███████ ██████   ██████  ██      ██ ██
local wed = worldeditdebug
worldedit.register_command("posdump", {
	params = "",
	description = "Dumps current worldedit selection positions to wed_debug.log.",
	privs = {debug=true,worldedit=true},
	require_pos = 2,
	parse = function(params_text)
		return true
	end,
	func = function(name)
		wed.log("//fp set1 "..wed.v2s(worldedit.pos1[name],true," ")..
			" //fp set2 "..wed.v2s(worldedit.pos2[name],true," "))
		return true, "Dump complete. Saved result to <worldname>/debug/wed_debug.log"
	end,
})

worldedit.alias_command("pd", "posdump")
-- worldeditdebug.xlate_dir("singleplayer","right")

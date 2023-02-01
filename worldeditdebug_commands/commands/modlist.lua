local wed = worldeditdebug
worldedit.register_command("modlist", {
	params = "",
	description = "Dumps the list of enabled mods to wed_debug.log.",
	privs = {debug=true,worldedit=true},
	-- require_pos = 0,
	parse = function(params_text)
		return true
	end,
	func = function(name)
		ret = {}
		for _,v in ipairs(minetest.get_modnames()) do
			table.insert(ret,v)
		end
		wed.log(table.concat(ret,"\n"))
		return true, "Dump complete. Saved result to worlds/"..minetest.get_worldpath():match("([^\\]+)$").."/debug/wed_debug.log"
	end,
})

worldedit.alias_command("ml", "modlist")

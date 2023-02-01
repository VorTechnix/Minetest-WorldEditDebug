--- WorldEditAdditions-DebugCommands
-- @module worldeditdebug_debug
-- @release 0.1
-- @copyright 2021 VorTechnium/VorTechnix
-- @license Mozilla Public License, 2.0
-- @author https://github.com/VorTechnix

-- Initialize worldeditdebug
worldeditdebug_commands = {}

-- Get mod path
local wed_com = worldeditdebug_commands
wed_com.modpath = minetest.get_modpath("worldeditdebug_commands")

-- Load mod files
dofile(wed_com.modpath.."/commands/benchmark.lua")
dofile(wed_com.modpath.."/commands/benchlog.lua")
dofile(wed_com.modpath.."/commands/bpreg.lua")
dofile(wed_com.modpath.."/commands/debug.lua")
dofile(wed_com.modpath.."/commands/log.lua")
dofile(wed_com.modpath.."/commands/modlist.lua")
dofile(wed_com.modpath.."/commands/posdump.lua")

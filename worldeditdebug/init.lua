--- WorldEditAdditions-DebugCommands
-- @module worldeditdebug_debug
-- @release 0.1
-- @copyright 2021 VorTechnium/VorTechnix
-- @license Mozilla Public License, 2.0
-- @author https://github.com/VorTechnix

-- Initialize worldeditdebug
worldeditdebug = {}

-- Initialize worldeditdebug.debug name table
worldeditdebug.debug = {}

-- Get mod path
local we_d = worldeditdebug
we_d.modpath = minetest.get_modpath("worldeditdebug")

-- Load mod files
dofile(we_d.modpath.."/lib/benchmark.lua")
dofile(we_d.modpath.."/lib/debug.lua")
dofile(we_d.modpath.."/lib/format.lua")
dofile(we_d.modpath.."/lib/log.lua")
dofile(we_d.modpath.."/lib/time.lua")

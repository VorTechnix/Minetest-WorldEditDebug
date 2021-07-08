--- table_tostring: convert key value pairs in a table to a single string
--
-- Parameters:
-- tbl (table) - input table
-- sep (string) - key value seperator
-- new_line (string) - key value pair delimiter
--
-- Return: string (concatenated table pairs)
function worldeditdebug.table_tostring(tbl, sep, new_line)
	if type(sep) ~= "string" then sep = ": " end
	if type(new_line) ~= "string" then new_line = ", " end
	local ret = {}
	if type(tbl) ~= "table" then return "Error: input not table!" end
	for key,value in pairs(tbl) do
		table.insert(ret,tostring(key) .. sep .. tostring(value) .. new_line)
	end
	return table.concat(ret,"")
end

--- split: split string by seperator
--
-- Parameters:
-- str (string) - input string
-- sep (string) - key value seperator
-- plain (bool) - seperator is regex?
--
-- Return: table (seperated strings)
function worldeditdebug.split(str, sep)
  if not type(str) == "string" then return nil end
  if not sep or sep == "" then sep = "," end
  local ret, _1, _2, _3 = {}, 0, 0, 0
  while true do
    _2, _3 = str:find(sep, _2)
    if not _2 then
      table.insert(ret, str:sub(_1, #str))
      break
    end
    table.insert(ret, str:sub(_1, _2))
    _2, _1 = _3 + 1, _2
  end
  return ret
end

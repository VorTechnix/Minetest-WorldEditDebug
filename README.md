# Minetest-WorldEditDebug

> Debugging tools and commands for Minetest mod devlopers and contributors to the Minetest WorldEdit mod family.

## Chat commands

WorldEdit Debug has several useful chat commands including benchmarking and logging. Chat commands are also used to toggle break points (see [#How to use](#how-to-use)).

For details and a full list of commands see [Chat-Command-Reference.md](https://github.com/VorTechnix/Minetest-WorldEditDebug/blob/main/Chat-Command-Reference.md).

## How to use

The `//debug <break-var>` command is designed for debugging chat commands both for the WorldEdit mod family and for main Minetest. To integrate debugging into a chat command simply follow these steps:

1. Add `worldeditdebug` as an optional dependency to your mod.

2. Insert the following code into the main function of the chat register function at the line where you want to stop the function and check things:

```lua
if worldeditdebug.debug[<break-var>][name] then
  -- Reminder and quick access for comand:
  -- //debug <break-var> -- Replace <break-var> with your variable name
  local tbl = {}
  -- Do stuff
  -- Add values and their names to tbl or set it equal to a vector
  return false, "Values = " .. worldeditdebug.table_tostring(tbl)
end
```

Replace `<break-var>` with whatever name you want to assign to that break point.

3. Insert the following code at the top of file in which the chat register function is contained (or anywhere outside the chat register function):

```lua
worldeditdebug.register({<break-var1>,<break-var2>,...})
```

If you only have one break point to register you can do:

```lua
worldeditdebug.register(<break-var1>)
```

The `worldeditdebug.register` function accepts tables or strings.

4. Once you start Minetest type `//debug <break-var>` into the chat (remembering to replace `<break-var>` with the actual breakpoint name). Then run the chat command you want to debug and it will print the values you added to `tbl` in step 1 to the chat.

## Example

The following code block is an example (for this one we make the return string as we go instead of using a table):

```lua
-- At top of file:
worldeditdebug.register("evalcheck")

-- Beginning of chat register function...
func = function(name, oper, mode, targ, base)
  -- Code Body...
  
  -- Test:
  if worldeditdebug.debug["evalcheck"][name] then
    local brk = ""
    for k,v in pairs(targ) do
      brk = brk..k..": "..delta[k]..", "
      delta[k] = eval(delta[k])
      brk = brk..k..": "..delta[k]..", "
    end
    return false, brk
  end
  
  -- More code...
  
end
```

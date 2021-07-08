# Chat Command Reference

This is the full chat command reference for WorldEditDebug.

Before we begin here are some useful links:

 - [WorldEditAdditions Chat Command Reference](https://github.com/sbrl/Minetest-WorldEditAdditions/blob/main/Chat-Command-Reference.md) 
 - [WorldEdit Chat Command Reference](https://github.com/Uberi/Minetest-WorldEdit/blob/master/ChatCommands.md)

**Note:** If anything in this reference isn't clear, that's a bug. Please [open an issue](https://github.com/VorTechnix/Minetest-WorldEditDebug/issues) (or even better a PR improving it) to let me know precisely which bit you don't understand and why.

## `//debug <string> [on/off]`
Toggles breakpoints that can be used to toggle tests in your code. See the [README](https://github.com/VorTechnix/Minetest-WorldEditDebug/blob/main/README.md#how-to-use) for details on [how to use](https://github.com/VorTechnix/Minetest-WorldEditDebug/blob/main/README.md#how-to-use).

Examples:

*-- Be sure to register the strings "evalcheck" and "paramcheck" using [//bpreg](#bpreg-string-unregister) before running the following commands unless you have [registered those strings in your code somewhere](https://github.com/VorTechnix/Minetest-WorldEditDebug/blob/main/README.md#how-to-use)*

```
//debug evalcheck
//debug evalcheck off
//debug paramcheck on
//debug paramcheck off
```

## `bpreg <string> [(un)register]`
Short for _break point register_. Registers breakpoints for testing `//debug`.

**Note:** When you use WorldEditDebug breakpoints in your code ***always*** [register them in your code](https://github.com/VorTechnix/Minetest-WorldEditDebug/blob/main/README.md#how-to-use) and ***NOT*** using `//bpreg` as doing so is bad practice especially in multi-player/multi-tester environments.

Examples:

```
//bpreg evalcheck
//bpreg evalcheck unregister
//bpreg paramcheck register
//bpreg paramcheck unregister
```

## `//benchmark <reps> <code>`

Executes `<code>` string `<reps>` times and tells you how long it took to do so. 

Note: I recommend using a value of at least 1000 for `<reps>` as anything less will usually (unless it's very complicated code) execute in fractions of a millisecond which won't give you a very accurate result when you calculate the average time per execution.

Examples:

```
//benchmark 10000 a = math.sqrt(math.pi^2)
//benchmark 10000 a = (math.pi^2)^0.5
```

## `//benchlog <reps> <code>`

Same as [`//benchmark`](#benchmark-reps-code) except `//benchlog` writes it's result to a file (`<minetest-instalation>/worlds/<worldname>/debug/wed_debug.log`).

Examples:

```
//benchlog 10000 a = math.sqrt(math.pi^2)
//benchlog 10000 a = (math.pi^2)^0.5
```

## `//log <text>`
Writes `<text>` to WorldEditDebug log file (`<minetest-instalation>/worlds/<worldname>/debug/wed_debug.log`).

Examples:

```
//log Hello Internet! Welcome to Game Theory!
//log Today I'm going to program!
```

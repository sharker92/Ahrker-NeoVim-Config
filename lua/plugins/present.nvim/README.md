# 'present.nvim`

Plugin for presenting markdown files.

# Usage

```lua
require("present").start_presentation {}
```

Use `n`, and `p` to navigate markdown slides.

Press `q` to exit.

Use `PresentStart` to start presentation.

# Features: Neovim Lua Execution

Can execute code in lua blocks, when you have them in a slide.

Press `X`

```lua
print("Hello world", 33, "this")
```

# Features: Other langs

Can execute code in Language blocks, when you have them in a slide.

You may need to configure this with `opts.executors`, only have Python and Javascript by default.

```javascript
console.log({myfield: true, other: false})
```

# Features 2

Can execute code in lua blocks, when you have them in a slide.

```python
print("this", "is", "python", "code")
```

# Credits

SHARKER
@tjdevries Advent of Neovim 🎄
https://github.com/tjdevries/present.nvim/blob/master/lua/present.lua


# 🥒 pickleterm.nvim

**pickleterm.nvim** is a lightweight Neovim plugin that lets you **open, reuse, and send commands** to named terminal buffers — so you can keep multiple interactive shells “pickled” for later use.

> Stop spawning new terminals every time — reuse them intelligently.

---

## ✨ Features

- 🧠 Open terminal buffers by **name** and automatically reuse them  
- 🚀 Send commands directly to existing terminal sessions  
- 🔁 Keeps terminals persistent between commands  
- ⚙️ Minimal Lua implementation — no dependencies

---

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "grimmjulian/pickleterm.nvim",
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "grimmjulian/pickleterm.nvim",
  config = function()
    require("pickleterm").setup()
  end
}
```

---

## 🧩 Usage

### Open or focus a named terminal

```lua
require("pickleterm").setup({R = {startcmd = "R"}})
require("pickleterm").open("R")
-- or both steps in one go for setting up a single terminal:
-- require("pickleterm").open("R", "R")
```

- Opens a terminal named `term://R`  
- If it doesn’t exist, runs the start command `R`

---

### Send commands to a terminal

```lua
require("pickleterm").send_cmd("R", "summary(cars)")
```

- Sends the command to the `term://R` buffer  
- Appends a newline automatically (simulating `<Enter>`)

---

## 🧠 Example Workflow

1. Open a terminal for your R REPL:
   ```lua
   :lua require("pickleterm").open("R_Terminal", "R")
   ```
2. Open another for running tests:
   ```lua
   :lua require("pickleterm").open("Test_Terminal", "pytest")
   ```
3. Send commands without leaving Neovim:
   ```lua
   :lua require("pickleterm").send_cmd("R_Terminal", "plot(1:10)")
   ```

---

## 🧰 API Overview

| Function | Description |
|-----------|--------------|
| `open(name, start_cmd)` | Open or reuse a terminal by name, optionally running a startup command. |
| `send_cmd(name, cmd)` | Send a command string to a named terminal. |

---

## 🪄 Planned Features

- [ ] Idle detection 
- [ ] Different options for opening the buffer

---

## 🧑‍💻 Contributing

Pull requests and ideas are welcome!  
Open an issue or PR on [GitHub](https://github.com/grimmjulian/pickleterm.nvim).

---

## 📜 License

MIT © 2025 [Julian Grimm]

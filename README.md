# Requirements

This configuration is primarily tailored for my personal environment.
It is not intended to be fully cross-platform or distro-agnostic.

If you have a similar setup, everything should work out of the box.

---

## System Requirements

To ensure full functionality, especially for Sixel image rendering and LSP features, install the following dependencies:

| Category | Dependency | Purpose |
| :--- | :--- | :--- |
| **Editor** | [Neovim v0.10+](https://github.com/neovim/neovim) | Core editor with LuaJIT support |
| **Fonts** | [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) | Essential for icons and UI components |
| **Search** | [ripgrep (rg)](https://github.com/BurntSushi/ripgrep) | Powers the `snacks.picker` grep features |
| **Discovery** | [fd](https://github.com/sharkdp/fd) | Optimized file discovery for pickers |
| **Images** | [ImageMagick](https://imagemagick.org/) | Critical for `image.nvim` processing |
| **Package** | [LuaRocks](https://luarocks.org/) | Manages Neovim Lua dependencies |

### Development Toolchains
* **Languages:** [Python & PIP](https://pypi.org/project/pip/) (for pyright/ruff), [Node.js & NPM](https://nodejs.org/) (for web LSPs), [Cargo](https://doc.rust-lang.org/cargo/) (for Rust).
* **VCS:** [Git](https://git-scm.com/) is required for `lazy.nvim` and `gitsigns`.

### Arch Quick Install
```bash
sudo pacman -S neovim git ripgrep fd imagemagick python-pip nodejs npm luarocks---
```
## Environment Assumptions

This setup was built and tested under:

- Arch Linux
- Hyprland (Wayland compositor)
- Foot terminal emulator

It may work on other Linux distributions, but that has not been tested.

---

## Optional (Visual / Aesthetic Layer)

These are not required, but strongly influence the look and feel:

- Caelestia (used for transparency and overall UI styling)
- Wayland environment (recommended if using Hyprland)

If you are not using Caelestia or Hyprland, the configuration will still work,
but the visual result may differ (transparency, blur effects, etc.).

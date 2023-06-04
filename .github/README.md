# AstroNvim User Configuration

My personal user folder for AstroVim
[Inspired](https://quoteinvestigator.com/2013/03/06/artists-steal/) from [mehalter](https://github.com/mehalter) config.
This config is bloated, but still very fast.
Startup time is under 40ms in linux and under 50ms in MacOS.
Coming from Lunarvim, i copied some stuff i loved from [lvim](https://github.com/abzcoding/lvim)
Most Plugins are lazy loaded, a lot can be toggled in [community.lua](lua/user/plugins/community.lua)

Status:

- Rust is working
- Go is is working
- typescript is working
- nix is working

A lot of the plugins are still in a testing stage and can be replaced any time.

## Installation

- Install AstroNvim
  Optional step
  Remove old configs/caches

```sh
rm -rf ~/.config/astronvim ~/.local/share/nvim ~/.config/nvim ~/.cache/nvim
```

- Clone the AstroVim core config nightly branch

```sh
git clone -b nightly https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
```

- Install these user settings

```sh
git clone https://github.com/luxus/astronvim.git ~/.config/astronvim
```

- Initialize AstroVim

```sh
nvim --headless "+Lazy! update" +qa; cd ~/.config/astronvim; nvim
```

# AstroNvim User Configuration

My personal user folder for AstroVim
[Inspired](https://quoteinvestigator.com/2013/03/06/artists-steal/) from [mehalter](https://github.com/mehalter) config.
This config is bloated, but still very fast.
Coming from Lunarvim, i copied some stuff i loved from [lvim](https://github.com/abzcoding/lvim)
Most Plugins are lazy loaded, a lot can be disabled by commenting out single lines in 
[extras.lua](lua/user/plugins/extras.lua)

Startup time is under 40ms in linux, 50-64ms under mac

Some Support is still missing:

- Rust support is basic.
- Go is a little tested.
- TeX is missing
- typescript is not well tested

## Installation

- Install AstroNvim
  Optional step
  Remove old configs/caches

```sh
rm -rf ~/.config/astronvim ~/.local/share/nvim ~/.config/nvim ~/.cache/nvim
```

- Clone the AstroVim core config v3 branch

```sh
git clone -b v3 https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
```

- Install these user settings

```sh
git clone https://github.com/luxus/AstroNvim_user ~/.config/astronvim
```

- Initialize AstroVim

```sh
nvim --headless "+Lazy! update" +qa; cd ~/.config/astronvim; nvim
```

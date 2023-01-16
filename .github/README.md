# AstroNvim User Configuration

My personal user folder for AstroVim
Mostly [inspired](https://quoteinvestigator.com/2013/03/06/artists-steal/) from [mehalter](https://github.com/mehalter) config.

## Installation

- Install AstroNvim
  Optional step
  Remove old configs/caches

```sh
rm -rf ~/.local/share/nvim ~/.config/nvim ~/.cache/nvim
```

Clone the AstroVim config and switch to v3 branch

```sh
git clone -b v3 https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
```

- Install these user settings

```sh
git clone https://github.com/luxus/AstroNvim_user ~/.config/nvim/lua/user
```

- Initialize AstroVim

```sh
nvim --headless "+Lazy! update" +qa; cd ~/.config/nvim/lua/user; nvim
```

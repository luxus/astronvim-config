# AstroNvim User Configuration

My personal user config for AstroVim

## Installation

- Install AstroNvim

```sh
git clone https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
```

- Install these user settings

```sh
git clone https://code.mehalter.com/AstroNvim_user ~/.config/nvim/lua/user
```

- Initialize AstroVim

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

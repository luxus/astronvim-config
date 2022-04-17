# AstroNvim User Configuration

My personal user config for AstroVim

## Installation

1. Install AstroNvim

```sh
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

2. Install these user settings

```sh
git clone https://git.mehalter.com/mehalter/AstroNvim_user.git ~/.config/nvim/lua/user
```

3. Initialize AstroVim

```sh
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

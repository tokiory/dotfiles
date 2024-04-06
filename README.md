<p align="center">
    <img width="700" src="./docs/logo.svg" />
</p>
<h3 align="center">Cold .files</h3>

There's my configurations for:

**Tmux** - Terminal multiplexer, to run multiple shells in the same session.

**Neovim** - A text editor that works with multiple languages. I use it in my daily work.

**Git** - A Git VCS configuration for my projects.

**Alacritty** - Terminal emulator.

**Zsh** - My default shell.

# Bootstrap
This configuration does not provide any shell files to bootstrap it.
Instead, you can use following code to bootstrap configurations, which you'll need.

**Installation Method: Copy**

```zsh
# Opt-in commentaries in zsh cli
setopt interactivecomments

# Download this repo
git clone https://github.com/tokiory/dotfiles .cdf && \
cd .cdf

# Install neovim
NVIM_PATH="$HOME/.config/nvim"
NVIM_CONFIG="$(pwd)/config/nvim"
test -d $NVIM_PATH && \
cp -r $NVIM_PATH{,_bkp} || \
mkdir -p $NVIM_PATH
cp -r $NVIM_CONFIG $NVIM_PATH

# Install zsh
test -f $HOME/.zshrc && \
mv $HOME/.zshrc{,_bkp}
cp config/zsh/zshrc $HOME/.zshrc

# Install gitconfig
test -f $HOME/.gitconfig && \
mv $HOME/.gitconfig{,_bkp}
cp config/git/gitconfig $HOME/.gitconfig

# Install tmux
test -f $HOME/.tmux.conf && \
mv $HOME/.tmux.conf{,_bkp}
cp config/tmux/tmux.conf $HOME/.tmux.conf

# Install alacritty
test -d $HOME/.config/alacritty && \
cp -r $HOME/.config/alacritty{,_bkp} || \
mkdir -p $HOME/.config/alacritty
cp -r config/alacritty $HOME/.config/alacritty
```

**Installation Method: Link**

If you wanna link this repo folder to your local configuration folders, use following command:
```bash
# Opt-in commentaries in zsh cli
setopt interactivecomments

# Download this repo
git clone https://github.com/tokiory/dotfiles .cdf && \
cd .cdf

# Global variables
CONFIG_FOLDER="$HOME/.config"

### Link neovim
NVIM_PATH="$HOME/.config/nvim"
NVIM_CONFIG="$(pwd)/config/nvim"
### {{{
test -d $NVIM_PATH && \
    mv $NVIM_PATH{,_bkp} || \
    mkdir -p $NVIM_PATH
ln -sF $NVIM_CONFIG $CONFIG_FOLDER
### }}}

### Link zshconfig
ZSH_PATH="$HOME/.zshrc"
ZSH_CONFIG="$(pwd)/config/zsh/zshrc"
### {{{
test -f $ZSH_PATH && \
    mv $ZSH_PATH{,_bkp}
ln -sF $ZSH_CONFIG $ZSH_PATH
### }}}

### Link gitconfig
GITCONFIG_PATH="$HOME/.gitconfig"
GITCONFIG_CONFIG="$(pwd)/config/git/gitconfig"
### {{{
test -f $HOME/.gitconfig && \
    mv $HOME/.gitconfig{,_bkp}
ln -sF $(pwd)/config/git/gitconfig $HOME/.gitconfig
### }}}

### Install tmux
TMUX_PATH="$HOME/.tmux.conf"
TMUX_CONFIG="$(pwd)/config/tmux/tmux.conf"
### {{{
test -f $HOME/.tmux.conf && \
    mv $HOME/.tmux.conf{,_bkp}
ln -sF $(pwd)/config/tmux/tmux.conf $HOME/.tmux.conf
### }}}

### Install alacritty
ALACRITTY_PATH="$HOME/.config/alacritty"
ALACRITTY_CONFIG="$(pwd)/config/alacritty"
### {{{
test -d $HOME/.config/alacritty && \
    mv $HOME/.config/alacritty{,_bkp} || \
    mkdir -p $HOME/.config/alacritty
ln -sF $(pwd)/config/alacritty $CONFIG_FOLDER
### }}}
```

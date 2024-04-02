<p align="center">
    <img width="700" src="./docs/logo.svg" />
    <h3>Code .files</h3>
</p>

There's my configurations for:

**Tmux** - Terminal multiplexer, to run multiple shells in the same session.

**Neovim** - A text editor that works with multiple languages. I use it in my daily work.

**Git** - A Git VCS configuration for my projects.

**Alacritty** - Terminal emulator.

**Zsh** - My default shell.

# Bootstrap
Use following scripts to bootstrap my config:

```zsh
# Download this repo
git clone https://github.com/tokiory/dotfiles .cdf && \
cd .cdf

# Install neovim
NVIM_PATH=$HOME/.config/nvim/
test -d $NVIM_PATH && \
cp $NVIM_PATH{,_bkp} || \
mkdir -p $NVIM_PATH
cp -r config/nvim $NVIM_PATH

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
cp $HOME/.config/alacritty{,_bkp} ||
mkdir -p $HOME/.config/alacritty
cp -r config/alacritty $HOME/.config/alacritty
```

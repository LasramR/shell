# FZF
echo "🔧 Installing fzf"
if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
else
    echo "FZF already installed, skipping"
fi

# Git
echo "🔧 Configuring git"
## Default branch
git config --global init.defaultBranch main

## Editor
if command -v nvim > /dev/null 2>&1; then
    git config --global core.editor "nvim"
else
    git config --global core.editor "vim"
fi

## Lines should end with LF
git config --global core.autocrlf false
git config --global core.eol lf

## Disable less-style command outputs
git config --global core.pager ""

## Lets change colors
git config --global color.ui auto

### Git status color
git config --global color.status.header "white normal dim"
git config --global color.status.branch "#ff5f5f"
git config --global color.status.added "#ffff00"
git config --global color.status.changed "#ff5f00"
git config --global color.status.deleted "#ff5f00 blink"
git config --global color.status.untracked "#00ff00"
git config --global color.status.unmerged "#ff0000 bold"
git config --global color.branch.remote "#ff0000 bold"

### Git branch color
git config --global color.branch.current "#ff5f5f"
git config --global color.branch.remote "#af5fff"

## Whoami
echo 'Please, set your email with `git config --global user.email`'
echo 'Please, set your username with `git config --global user.name`'

echo "🔧 Configuring zsh and omz"
# zsh (+omz)

## Installing zsh and omz
if ! command -v zsh > /dev/null 2>&1; then
    echo "zsh not found, installing"
    sudo apt install zsh
fi
if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "omz not found, installing"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

## plugins
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo 'zsh plugin `zsh-autosuggestions` not found, installing'
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo 'zsh plugin `zsh-syntax-highlighting` not found, installing'
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

## zsh config
cp res/.zshrc $HOME/.zshrc

## zsh user config
cp -rT res/.zsh $HOME/.zsh

## zsh theme
cp res/lasramr.zsh-theme  $HOME/.oh-my-zsh/themes

echo "🚀 Ready to go!"


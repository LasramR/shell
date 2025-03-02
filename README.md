# Shell

This is my shell setup that I use daily, it includes:
* zsh
* oh-my-zsh
* fzf
* some git tweaks

## Installation

To use my terminal setup, you can run:

```bash
git clone https://github.com/LasramR/shell.git "$HOME/lasram-shell" && cd "$HOME/lasram-shell" && ./setup.sh
```

## Features

* [zsh](https://www.zsh.org/): extended bash shell
* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh): zsh customization framework (eg style, new features)
* [fzf](https://github.com/junegunn/fzf): command line fuzzy finder for files, history, ...

## Zsh plugins

* copybuffer (oh-my-zsh): copy current command line into clipboard with `<C-o>`
* web-search (oh-my-zsh): quickly throw a new web search using google (`google <query>`) or duckduckgo (`ddg <query`)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): fish-like auto suggestion from your history
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): command prompt syntax highlighting

## Zsh integrations

* fzf: start a fuzzy search in the command prompt with `<C-t>`

## Zsh theme (lasramr)

![LasramR theme](./assets/theme.gif)

* prompt: user, path, datetime 
* git prompt: current branch, rebase status, file changes
* custom ls colors
* custom zsh-syntax-highlighting colors


export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# zsh-autosuggestions: fish like auto suggestions
# web-search: `ddg <search>` will open a new DuckDuckGo search
# copybuffer: CTRL+O copy current command in clipboard
plugins=(zsh-autosuggestions web-search copybuffer zsh-syntax-highlighting)

# Set name of the theme to load
ZSH_THEME="lasramr"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# User configuration

# Disable less-style pagination for most (git) commands
unset LESS

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo
. "$HOME/.cargo/env"

# Fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# User aliases
source "$HOME/.zsh/.zshrc.aliases"

# User environment variables
source "$HOME/.zsh/.zshrc.env"

# Theme config
export ZGIT_SHOW_STATUS=1
export ZGIT_SHOW_REBASE=1

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

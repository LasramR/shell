# Color table: https://github.com/foize/go.sgr/blob/40bdfc98040cd18ebb4d68e91ab97f6c58366ad8/xterm_color_chart.png

# Plugins

# Auto suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

# Syntax highlighting
# see https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
ZHIGHLIGHT_COLOR="231,bold"
ZQUOTES_HIGHLIGHT_COLOR="123"
ZDOUBLE_QUOTES_PARAM_COLOR="227"
ZAUTODIRECTORY_COLOR="033"

ZSH_HIGHLIGHT_STYLES[builtin]="fg=$ZHIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[command]="fg=$ZHIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$ZHIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[function]="fg=$ZHIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=$ZHIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=$ZQUOTES_HIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$ZQUOTES_HIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$ZQUOTES_HIGHLIGHT_COLOR"
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR"
ZSH_HIGHLIGHT_STYLES[command-substitution]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR"
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR"
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR"
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR"
ZSH_HIGHLIGHT_STYLES[comment]="fg=$ZDOUBLE_QUOTES_PARAM_COLOR" # For some reason this affect env var in command substitution
ZSH_HIGHLIGHT_STYLES[autodirectory]="fg=$ZAUTODIRECTORY_COLOR"

# Git
ZGIT_PROMPT_INFO_CACHE=""
ZGIT_PREFIX=" [git:"
ZGIT_SUFFIX="]"
ZGIT_COLOR="$FG[135]"
ZGIT_STATUS_COLOR="$FG[196]"
ZGIT_STATUS_STAGING_COLOR="$FG[227]"
ZGIT_BRANCH_COLOR="$FG[203]"
ZGIT_REBASE_COLOR="$FG[123]"

zgit_prompt_info() {
  local git_dir branch 

  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -z $branch ]] && ZGIT_PROMPT_INFO_CACHE="" && return;

  ZGIT_PROMPT_INFO_CACHE="$ZGIT_COLOR$ZGIT_PREFIX%{$reset_color%}"
  ZGIT_PROMPT_INFO_CACHE+="$ZGIT_BRANCH_COLOR$branch%{$reset_color%}"

  git_dir=$(git rev-parse --git-dir 2>/dev/null)

  if [[ -v ZGIT_SHOW_REBASE ]] && [[ ! $ZGIT_SHOW_REBASE == 0 ]] && [[ -d "$git_dir/rebase-merge" ]]; then
    local rebase_current_step rebase_total_steps

    rebase_current_step=$(cat "$git_dir/rebase-merge/msgnum" 2>/dev/null || echo "?")
    rebase_total_steps=$(cat "$git_dir/rebase-merge/end" 2>/dev/null || echo "?")

    ZGIT_PROMPT_INFO_CACHE+="|$(echo $ZGIT_REBASE_COLOR)REBASING $rebase_current_step/$rebase_total_steps%{$reset_color%}"
  fi

  if [[ -v ZGIT_SHOW_STATUS ]] && [[ ! $ZGIT_SHOW_STATUS == 0 ]]; then
    local gsp_out modified untracked deleted staged

    gsp_out=$(git status --porcelain 2>/dev/null)

    modified=$(echo "$gsp_out" | grep -Ec '^\s?M')   # Modified
    untracked=$(echo "$gsp_out" | grep -c '^??') # Untracked
    deleted=$(echo "$gsp_out" | grep -c '^\s?D') # Deleted
    staged=$(echo "$gsp_out" | grep -c '^[MADRC] ') # Staged for commit

    if (( modified + untracked + deleted + staged != 0 )); then
        local  ZGIT_PROMPT_STATUS_COLOR
        
        ZGIT_PROMPT_STATUS_COLOR=$([[ $staged -eq 0 ]] && echo "$ZGIT_STATUS_COLOR" || echo "$ZGIT_STATUS_STAGING_COLOR")

        ZGIT_PROMPT_INFO_CACHE+="$ZGIT_PROMPT_STATUS_COLOR ~$modified +$untracked -$deleted%{$reset_color%}"
    fi
  fi
  ZGIT_PROMPT_INFO_CACHE+="$ZGIT_COLOR$ZGIT_SUFFIX%{$reset_color%}"
}

# Fzf
# Generated with https://minsw.github.io/fzf-color-picker/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#d0d0d0,bg:-1,hl:#005fff --color=fg+:#d0d0d0,bg+:#3a3a3a,hl+:#0087ff --color=info:#d0d0d0,prompt:#ff5f5f,pointer:#ff00af --color=marker:#d700af,spinner:#ff00af,header:#ff5f5f'

# Ls
export CLICOLOR=1
export LS_COLORS="\
di=38;2;0;135;255:\
fi=38;2;255;255;225:\
so=38;2;255;95;0:\
ln=38;2;0;215;0:\
mi=38;2;175;0;0:\
ex=38;2;255;255;47:\
*.zip=38;2;135;0;255:\
*.tar=38;2;135;0;255:\
*.gz=38;2;135;0;255:\
"
alias ls='ls --color=auto'

# Prompt

ZUSER_COLOR="$FG[199]"
ZUSER="%{$ZUSER_COLOR%}%n%{$reset_color%}"

ZHOST_COLOR="$FG[202]"
ZHOST="%{$ZHOST_COLOR%}[%m]%{$reset_color%}"

ZPWD_COLOR="%B$FG[033]"
ZPWD="%{$ZPWD_COLOR%}%~%{$reset_color%}"

ZTIME_COLOR="$FG[237]"
ZTIME="%{$ZTIME_COLOR%}[%D %T]%{$reset_color%}"

ZINPUT_COLOR="%{$FG[203]%}"
ZINPUT="
$ZINPUT_COLOR>%{$reset_color%} "

precmd_functions+=(zgit_prompt_info)

PROMPT="$ZUSER at $ZPWD\${ZGIT_PROMPT_INFO_CACHE}$ZINPUT"
RPROMPT="$ZTIME%{$reset_color%}"


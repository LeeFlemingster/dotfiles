## Insparation list bira darkblood funky jonathan juanghurtado kiwi

# ToDo make HR line

## lee

plugins=(vi-mode, git)

#VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true 
#VI_MODE_SET_CURSOR=true

# Color shortcuts
RESET_COLOUR=$reset_color
RED=${RESET_COLOUR}$fg[red]
YELLOW=${RESET_COLOUR}$fg[yellow] 
GREEN=${RESET_COLOUR}$fg[green]
WHITE=${RESET_COLOUR}$fg[white] 
BLUE=${RESET_COLOUR}$fg[blue]
RED_BOLD=${RESET_COLOUR}$fg_bold[red]
YELLOW_BOLD=${RESET_COLOUR}$fg_bold[yellow]
GREEN_BOLD=${RESET_COLOUR}$fg_bold[green]
WHITE_BOLD=${RESET_COLOUR}$fg_bold[white]
BLUE_BOLD=${RESET_COLOUR}$fg_bold[blue]

boarder_colour=$GREEN_BOLD 
boarder_text=$WHITE_BOLD

local topline_start="${boarder_colour}┌─%{$reset_color%}" 
local bottomline_start="${boarder_colour}╰─%{$reset_color%}" 
local boarder_start="${boarder_colour}(%{$reset_color%}" 
local boarder_mid="${boarder_colour})-(%{$reset_color%}" 
local boarder_end="${boarder_colour})%{$reset_color%}"

local current_dir="${boarder_text}%~" 
local user_host="${boarder_text}%n${boarder_colour}@${RESET_COLOUR}${boarder_text}%m%{$reset_color%}"

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="" 
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)" 
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted" 
ZSH_THEME_GIT_PROMPT_RENAMED=" %B%{$YELLOW%}renamed" 
ZSH_THEME_GIT_PROMPT_MODIFIED=" %B%{$YELLOW%}modified" 
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added" 
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

#ZSH_THEME_GIT_PROMPT_PREFIX="${boarder_colour}-("
#ZSH_THEME_GIT_PROMPT_SUFFIX="${boarder_colour})"
ZSH_THEME_GIT_PROMPT_PREFIX="${boarder_mid}" 
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Git Prompt format
function git_prompt() { 
local git=$(git_prompt_info) 
if [ ${#git} != 0 ]; then
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${boarder_text}$(git_current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
else 
fi 
}

local ret_status="${boarder_text}%?" 
local ret_status="%(?,${boarder_text}%?%{$reset_color%},${RED_BOLD}%?)" 
local hist_no="${boarder_text}%h" 
local hist_no="${boarder_text}%h"
#local user_symbol='%(!.#.$)'

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Updates editor information when the keymap changes.
function zle-keymap-select() { 
    zle reset-prompt 
    zle -R 
}


unset RPROMPT

function zle-line-init zle-keymap-select { 
PROMPT='\
${boarder_colour}(%{$reset_color%}${current_dir}\
${boarder_colour})-(%{$reset_color%}${user_host}\
$(git_prompt)\
${boarder_colour})-(%{$reset_color%}${ret_status}\
${boarder_colour})-(%{$reset_color%}${hist_no}\
${boarder_end}\

${bottomline_start} \
${${KEYMAP/vicmd/%F{yellow\}%B%#%b%F{yellow\}}/(main|viins)/%B%F{green\}%#%F{reset\}}%b ' 
zle reset-prompt}

precmd() { print "" }

zle -N zle-line-init 
zle -N zle-keymap-select


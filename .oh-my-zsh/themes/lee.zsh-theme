## Insparation list bira darkblood funky jonathan juanghurtado kiwi

# ToDo make HR line

## lee

plugins=(vi-mode, git)
#
## Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Updates editor information when the keymap changes.
function zle-keymap-select() { 
    zle reset-prompt 
    zle -R 
}

unset RPROMPT

local RED_BOLD=$fg_bold[red]
local GREEN_BOLD="%B%F{green}"
local reset="%b%f"
local return_status="%(?,%?,${RED_BOLD}%?${reset})" 

# Git Prompt format
function git_prompt() { 
local git=$(git_prompt_info) 
if [ ${#git} != 0 ]; then
    echo "${GREEN_BOLD})-(${reset}$(git_current_branch) $(git_prompt_short_sha)$(git_prompt_status)"
else 
fi 
}

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="" 
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}(*)${reset}" 
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %F{red}unmerged${reset}"
ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}deleted${reset}" 
ZSH_THEME_GIT_PROMPT_RENAMED=" %B%F{yellow}renamed${reset}" 
ZSH_THEME_GIT_PROMPT_MODIFIED=" %B%F{yellow}modified${reset}" 
ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}added${reset}" 
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{white}untracked${reset}"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %F{red}(!)${reset}"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$WHITE%}[%F{yellow}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="${reset}]"


function zle-line-init zle-keymap-select { 
PROMPT='\
${GREEN_BOLD}(${reset}%~${GREEN_BOLD})-(${reset}%n${GREEN_BOLD}@${reset}%m$(git_prompt)${GREEN_BOLD})-(${reset}${return_status}${GREEN_BOLD})-(${reset}%h${GREEN_BOLD})${reset} \

${GREEN_BOLD}╰─${reset}${${KEYMAP/vicmd/%F{yellow\}%B%#%b%F{yellow\}}/(main|viins)/%B%F{green\}%#%F{reset\}}%b ' 
zle reset-prompt}


zle -N zle-line-init 
zle -N zle-keymap-select


##local user_symbol='%(!.#.$)'

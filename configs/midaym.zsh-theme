local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='
$fg_bold[cyan]%n$fg_bold[blue]@$fg_bold[magenta]%m$fg_bold[yellow] %~$(git_prompt_info)
${ret_status} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="$fg_bold[blue] [%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}$fg_bold[blue]]$fg_bold[green] ✓"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}$fg_bold[blue]]$fg_bold[red] ✘"

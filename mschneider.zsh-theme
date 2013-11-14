function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}



function get_pwd() {
  print -D $PWD
}

function ruby_version() {
  echo `~/.rvm/bin/rvm-prompt i v`
}

function gemset() {
  echo `~/.rvm/bin/rvm-prompt g`
}

function put_spacing() {

  local gemset_ver=$(gemset)
  if [ ${#gemset_ver} != 0 ]; then
    ((gemset_ver = ${#gemset_ver}))
  else
    gemset_ver=0
  fi

  local ruby_ver=$(ruby_version)
  if [ ${#ruby_ver} != 0 ]; then
    ((ruby_ver = ${#ruby_ver}))
  else
    ruby_ver=0
  fi

  local git=$(current_branch)
  if [[ ${#git} != 0 ]]; then
     ((git=${#git} + 2))
  else
    git=0
  fi

  local termwidth
  local getpwd=$(get_pwd)
  (( termwidth = ${COLUMNS} - 3 - ${#getpwd} - ${ruby_ver} - ${gemset_ver} - ${git}))
  local spacing=""
  for i in {1..$termwidth}; do
    spacing="${spacing} "
  done
  echo $spacing
}

# GIT

ZSH_THEME_GIT_PROMPT_PREFIX="$fg[blue]["
ZSH_THEME_GIT_PROMPT_SUFFIX="$fg[blue]]$reset_color"
#ZSH_THEME_GIT_PROMPT_DIRTY="$fg[blue]✗"
#ZSH_THEME_GIT_PROMPT_CLEAN="$fg[blue]✓"

# Username & hostname information
#SCHNEIDER_CURRENT_USERHOST_="%{$fg_bold[white]%}%n@%{$fg[white]%}%m"

# Put it all together!
function precmd {
  print -rP '
$fg[red]%# $fg_bold[red]$(get_pwd)$reset_color$(put_spacing)$(git_prompt_info) $fg_bold[blue]$(ruby_version)$fg_bold[white]$(gemset)'
}
PROMPT="%{$fg_bold[white]%}%n@%{$fg[white]%}%m %{$fg_bold[white]%}♯ 》%{$reset_color%}"

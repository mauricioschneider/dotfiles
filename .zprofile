export LC_CTYPE="en_US.UTF-8"

# NPM
export NODE_PATH=/usr/local/lib/node_modules

# PATH
export PATH="/usr/local/share/npm/bin:/usr/local/bin:/usr/local/share/python:$PATH"

# virtualenvwrapper settings
export WORKON_HOME="~/.virtualenvs"
source "/usr/local/share/python/virtualenvwrapper.sh"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
__rvm_project_rvmrc

# shell session
if [ -n "$SSH_CLIENT" ]; then 
  sshSession=" ssh-session"
fi

# PS1="\W \$"
# PS1="\[\033[31m\]\w \$\[\033[36m\]"
# PS1="\W $"

# support git branch
PS1='\[\033[40;1;32m\]\u\[\033[2;32m\]@\[\033[0m\]\[\033[40;32m\]\h \[\033[1;36m\]\w \[\033[31m\]$(__git_ps1 "[%s] ")\[\033[00m\]\[\033[0m\]\[\033[40;2;37m\]`date +"%m-%d %H:%M"` \[\033[0m\]\n\\$ '

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# JAVA
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias ll="ls -alG"
alias ls="ls -G"
alias myip="curl inet-ip.info"

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcia='git commit -a -m'
alias gcim='git commit -m'
alias gci='git commit'
alias gcm='git checkout master'
alias gd='git diff'
alias gf='git fetch'
alias gpl='git pull'
alias gph='git fetch && git push'
alias gpho='git fetch && git push -u origin HEAD'
alias gpt='git push --tags'
alias gl='git log --graph --date=format:"%Y%m%d[%a]%H%M" --pretty=format:"%x09%C(white ul)%an%Creset%x09 %C(cyan)%cd %C(dim green)%h%Creset %C(yellow reverse)%s%Creset %C(magenta reverse)%d%Creset" --remotes --branches'
alias gs='git status'
alias grom='git rebase origin/master'

alias n="npm"
alias nr="npm run"
alias nin="npm install"
alias nun="npm uninstall"

alias d="sudo docker"

alias glui="git config --local user.name thetwin && git config --local user.email 'thet_win@waku-2.com'"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias pip="pip --trusted-host pypi.python.org"
alias pip3="pip3 --trusted-host pypi.python.org"

# completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
source ~/profile/git-completion.bash
source ~/profile/git-prompt.sh
source ~/profile/docker-compose.sh
source ~/profile/docker

# export PATH=$PATH:/Volumes/data-hd/bin/npm/bin
export PATH=$PATH:`npm bin -g`

function dip() {
  docker inspect -f "{{.NetworkSettings.IPAddress}}" $1
}

function dlogin() {
  docker exec -it $1 bash
}

function copyCurrentBranch() {
  current="$(git rev-parse --abbrev-ref HEAD)"
  new_branch="${current}_$(date '+%Y%m%d_%H%M%S')"

  git checkout -b $new_branch
  git checkout $current
}

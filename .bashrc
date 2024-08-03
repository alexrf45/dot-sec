shopt -s histappend
shopt -s checkwinsize
HISTFILE="$HOME/.history"
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%Y-%m-%d %T - '

force_color_prompt=yes

source "$HOME/.profile"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

for file in $HOME/.bash/*; do
  source "$file"
done

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

#PROMPT_COMMAND='PS1_CMD1=$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2)'
#PS1='\[\e[93;2;3m\]${AWS_VAULT}\[\e[0m\] \n\[\e[92;1m\]${PS1_CMD1}\[\e[0m\] \[\e[95m\]\W\[\e[0m\] →  '

if [ "$color_prompt" = yes ]; then
  PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\] "
else
  PS1='┌──[\u@\h]─[\w]\n└──╼ \$ '
fi

case "$TERM" in
xterm* | rxvt* | tmux*)
  VPN=$(ps -ef | grep 'openvpn ' | tail -1 | rev | awk '{print $1}' | rev | sed 's/\..*$//g')
  IP=$(ip -4 -o addr show ens33 | awk '{print $4}' | sed 's/\/.*$//g')
  if [ ! -z "$VPN" ]; then
    IP=$(ip -4 -o addr show tun0 | awk '{print $4}' | sed 's/\/.*$//g')
  fi
  PS1="\[\033[1;32m\]\342\224\214\342\224\200\$([[ \${IP} == *\"10.\"* ]] && echo \"[\[\033[1;34m\]\${VPN}\[\033[1;32m\]]\342\224\200\033[1;37m\]\[\033[1;32m\]\")[\[\033[1;37m\]\${IP}\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[1;32m\]]\342\224\200[\[\033[1;37m\]\w\[\033[1;32m\]]\n\[\033[1;32m\]\342\224\224\342\224\200\342\224\200\342\225\274 [\[\e[01;33m\]★\[\e[01;32m\]]\\$ \[\e[0m\]"
  ;;
*) ;;
esac

complete -C '/usr/local/bin/aws_completer' aws

eval $(ssh-agent) >/dev/null 2>&1

ssh-add ~/.ssh/lab >/dev/null 2>&1
ssh-add ~/.ssh/home >/dev/null 2>&1
ssh-add ~/.ssh/fr3d >/dev/null 2>&1
ssh-add ~/.ssh/vps >/dev/null 2>&1

. "$HOME/.cargo/env"

eval "$(fzf --bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#eval "$(starship init bash)"

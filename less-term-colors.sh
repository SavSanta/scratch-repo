# less/manpage more readable (orange and baby blue colors on black.)
# save in /etc/profile or /etc/profile.d/
# less initialization script (sh)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="${LESSOPEN-||/usr/bin/lesspipe.sh %s}"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;208m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;111m'


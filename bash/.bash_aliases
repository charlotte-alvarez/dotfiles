# ls
alias ll="ls -al"

# source (to test .bashrc changes)
alias source="source ~/.config/.bashrc && echo $?"


# Git related
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gd="git diff"
alias ga="git add"
alias gaa="git add --all"
alias gap="git add -p"
alias gdc="git diff --cached"
alias gb="git branch"
alias gc="git checkout"
alias gcn="git checkout -b"
alias gr="git restore --staged"


# Nvim related
alias vim="nvim"

# Python related
alias py="python3"
alias python="python3"

# Apt related
alias aptu="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"

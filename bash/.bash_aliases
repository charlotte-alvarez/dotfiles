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
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d' # Delete local branches which have already been merged


# Nvim related
alias vim="nvim"

# Python related
alias py="python3"
alias python="python3"

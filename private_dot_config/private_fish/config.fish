if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Git alias
alias g='git'
alias gs='git status'
alias gco='git checkout'
alias gst='git stash'
alias gdiff='git diff --cached | gitx'
alias gfpush='git push --force-with-lease -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gr='git pull --rebase origin main'
alias gap='git add -p'
alias gc='git commit -v'
alias gp='git push origin'
alias ga='git add'
alias wip='git add . && git commit -m "[skip ci] wip" -n'
alias gmain='git pull --rebase origin main'

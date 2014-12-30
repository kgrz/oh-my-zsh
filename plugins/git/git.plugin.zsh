# Aliases
compdef g=git
#compdef _git gst=git-status
#compdef _git gd=git-diff
#compdef _git gdc=git-diff
#compdef _git gl=git-pull
#compdef _git gup=git-fetch
#compdef _git gp=git-push
gdv() { git diff -w "$@" | view - }
#compdef _git gdv=git-diff
#compdef _git gc=git-commit
#compdef _git gc!=git-commit
#compdef _git gc=git-commit
#compdef _git gca!=git-commit
#compdef _git gcmsg=git-commit
#compdef _git gco=git-checkout
#compdef _git gr=git-remote
#compdef _git grv=git-remote
#compdef _git grmv=git-remote
#compdef _git grrm=git-remote
#compdef _git grset=git-remote
#compdef _git grset=git-remote
#compdef _git grbi=git-rebase
#compdef _git grbc=git-rebase
#compdef _git grba=git-rebase
#compdef _git gb=git-branch
#compdef _git gba=git-branch
#compdef gcount=git
#compdef _git gcp=git-cherry-pick
#compdef _git glg=git-log
#compdef _git glgg=git-log
#compdef _git glgga=git-log
#compdef _git glo=git-log
#compdef _git glog=git-log
#compdef _git gss=git-status
#compdef _git ga=git-add
#compdef _git gm=git-merge
alias gclean='git reset --hard && git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Sign and verify commits with GPG
alias gcs='git commit -S'
compdef _git gcs=git-commit
alias gsps='git show --pretty=short --show-signature'
compdef _git gsps=git-show

# Sign and verify tags with GPG
alias gts='git tag -s'
compdef _git gts=git-tag
alias gvt='git verify-tag'
compdef _git gvt=git verify-tag

#remove the gf alias
#alias gf='git ls-files | grep'

alias gmt='git mergetool --no-prompt'
compdef _git gm=git-mergetool

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
alias glp="_git_log_prettily"
compdef _git glp=git-log

# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}
# these alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -r0 git rm; git commit -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

# these alias ignore changes to file
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'
# list temporarily ignored files
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

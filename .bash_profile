if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
source "$HOME/.profile" # Load the default .profile

alias ls='ls -G'
alias gco='git checkout'

function gcolg {
   git checkout $1
   git lg -5
}

function deleteBranch {
   git checkout master
   git branch -D $1
   read -p "Delete branch from remote ${1}?" -n 1 -r
   echo    # (optional) move to a new line
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
	git push origin --delete $1
   fi
}


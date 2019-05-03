# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/olalansman/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=7
POWERLEVEL9K_APPLE_ICON='\uF8FF'
POWERLEVEL9K_VCS_SHORTEN_LENGTH=10

# Shorter command
DEFAULT_USER="olalansman"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Don't correct anything, needs to be after sourcing oh-my-zsh
unsetopt correct_all

export PATH=/usr//local/bin/:/usr/local/bin/:/usr/local/bin/:./bin:$PATH

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias ls='ls -G'
alias gco='git checkout'
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`"
alias relex_test_debug="with_debug relex rails c -e test"
alias relex_debug="with_debug relex b"
alias remove_vali="sed 's#VALI#\'$'\n#g'"
alias ls='colorls -lA --sd'
alias vimAppConfig='vim ~/workprojects/processor-edge/backend/config/application_settings.json'
alias cdback='cd /Users/olalansman/workprojects/processor-edge/backend'

function gcolg {
   git checkout $1
   git lg -5
}

function deleteBranch {
   git checkout master
   git branch -D $1
   echo "Delete branch from remote ${1}? y/n"
   read -q 
   echo    # (optional) move to a new line
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
	git push origin --delete $1
   fi
}

function make_srt_westi {
   sed 's#VALI#\'$'\n#g' $1 | sed 's#"##g' | sed 's#,##g' | sed 's#--># --> #g' | sed 's#000#00#g' >> $2
}

function ssh_narnia {
    ssh narnia$1@narnia.labs.overthewire.org -p 2226
}

function ssh_bandit {
    ssh bandit{$1}@bandit.labs.overthewire.org
}
function createBranchOnMaster {
    gco master ; git pull ; gco -b $1
}

function rebaseOnMaster {
    BRANCH=$(git symbolic-ref --short HEAD)
    gco master ; git pull ; gco $BRANCH ; git rebase master
}

j8
source "/Users/olalansman/.relex_functions"

eval "$(rbenv init -)"
rbenv shell 2.5.1

source $(dirname $(gem which colorls))/tab_complete.sh

unset LESS # Allow git log to remain on screen if it fits§

# added by Anaconda2 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda2/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/anaconda2/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

alias cdschool='cd ~/schoolprojects'
alias removelogs='rm -rf /Users/olalansman/workprojects/processor-edge/backend/log'
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

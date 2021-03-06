# Functions
function parse_git_dirty() {
        [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
function get_git_branch() {
	echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

# Calculator!
function calc {
    echo "$@" | bc -l
}

# Easy git cloning (i.e. 'clone jblaak/.dotfiles')
function clone() {
   git clone git@github.com:$1.git
}

# Git (not so serious)
alias wollah='git add . && git commit -am '
alias whoop='git monsterpull origin '
alias ga='git add .'
alias gs='git status'
alias gc='git commit -am'
alias gp='git push origin `get_git_branch`'
alias gl='git pull origin `get_git_branch`'
alias gb='git branch'
alias gu='git reset'
alias gpp='git remote prune origin'

# Switching nginx and mysql on/off
alias servstart='sudo service nginx start && sudo service mysql start'
alias servstop='sudo service nginx stop && sudo service mysql stop'

# Serve PHP files the simple way
alias serve='php -S localhost:8090 -t ./'

# Gcutil
function gcutil_ssh() {
	gcloud compute --project=$1 ssh $2
}
alias gssh=gcutil_ssh

# Artisan
alias art='php artisan --env=local'
alias gm='php artisan --env=local generate:migration'
alias artt='php artisan --env=testing'
alias ams='php artisan migrate:refresh --seed'

# PHPUnit testing
alias phpunit='./vendor/bin/phpunit'

# Behat/selenium testing
alias behat='vendor/bin/behat'
alias servebehat='php artisan serve --host=behat.localhost'
alias rb='php artisan --env=testing migrate && php artisan --env=testing db:seed && grunt && vendor/bin/behat --verbose --stop-on-failure'
alias sb='php artisan serve --host=behat.localhost'
alias selenium='xvfb-run --server-args="-screen 0, 1920x1080x24" java -jar ~/Tools/selenium-server-standalone-2.47.1.jar'

# Package managers
alias ci='composer install'
alias cu='composer update'
alias cda='composer dump-autoload'
alias cr='composer require --save'
alias crd='composer require --save-dev'
alias bi='bower install --save'
alias bid='bower install --save-dev'
alias bu='bower update'

# Node module shortcuts
alias gr='grunt'
alias grj='grunt jsx'
alias glp='./node_modules/.bin/gulp'
alias gulp='./node_modules/.bin/gulp'

# Nload defaults to 1992 speeds
alias nload='nload -i 100000'

# Heroku
alias hlog='heroku logs --tail'

# Some locations
alias ..='cd ..'
alias home='cd ~'
alias h='cd ~'
alias dev='cd ~/Development'
alias downloads='cd ~/Downloads'
alias down='cd ~/Downloads'
alias tools='cd ~/Tools'

# Just handy
alias la='ls -a'
alias c='clear'

# Tar
alias untar='tar -zxvf'

# Apt-get
alias uninstall='sudo apt-get remove'
alias install='sudo apt-get install'

# setting the default editor to Sublime
export EDITOR='subl -w'

# When PHPStorm loses keyboard input
alias doenormaal='ibus restart'

# Create ssh-tunnel to Mysql in VM
alias tunnelvm='ssh -N -p 2222 root@127.0.0.1 -L 33306:localhost:3306'

# Some colors and settings of those
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
RESETCOLOR="\[\e[0m\]" 

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Styling the PS1 (prefix etc. showing current git branch)
export PS1="\n【ツ】${BLUE}\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"  ${YELLOW}\")\$(parse_git_branch)\n${RESETCOLOR} → "



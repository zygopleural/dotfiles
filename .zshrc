if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

plugins=(git nvm zsh-nvm zsh-autosuggestions zsh-syntax-highlighting)

SH_DISABLE_COMPFIX="true"

source "${ZSH}/oh-my-zsh.sh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

setopt AUTO_CD

hash -d m=~/code/nous/monorepo
hash -d e=~/code/experiments

function y() {
  yarn ${@}
}
function t() {
  LOG_LEVEL=silent yarn redwood test api --verbose ${@}
}
function d() {
  for BRANCH in "$@"
  do
    echo "Deleting: ${BRANCH}"
    git branch -D "${BRANCH}"
  done
}
function rebase() {
  git checkout main && git pull && git checkout ${@} && git rebase -i main
}
function checkout() {
  gt branch checkout ${@}
}
function create() {
  gt branch create -a ${1} -m ${2}
}
function commit() {
  gt commit create -a -m ${1}
}
alias fix="gt stack fix"
alias sync="gt repo sync"
alias submit="gt stack submit"
alias yd="yarn redwood dev"
alias ys="yarn redwood storybook"
alias yf="yarn faktory"
alias yl="yarn lint"
alias ytc="yarn type-check"
alias yp="yarn prepare"
alias ym="yarn redwood prisma migrate dev"
alias yfc="yarn fetch-content"
alias ygt="yarn redwood generate types"
alias di="docker images"
alias du="docker-compose up -d"
alias dd="docker-compose down -v"
alias release="git checkout main && git pull && git checkout production && git pull && git merge main && git push" 
alias gpf="git push --force"

dir() { docker image rm "${@}"; }
setopt auto_menu auto_cd auto_pushd correct auto_name_dirs auto_remove_slash
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys
_cache_hosts=(`ruby -ne 'if /^Host\s+(.+)$/; print $1.strip, "\n"; end' ~/.ssh/config`)
autoload -U compinit
compinit

#if [ -f ~/etc/proxy ]; then
#    . ~/etc/proxy
#fi

#export LANG=ja_JP.UTF-8

#bindkey "^[[3~" delete-char
#bindkey "^[[1~" beginning-of-line
#bindkey "^[[4~" end-of-line

PROMPT="%/%% "
#RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

#function _ssh {
#  compadd `fgrep 'Host ' ~/.ssh/config | awk '{print $2}' | sort`;
#}

#compdef _rake rake
#_rake_does_task_list_need_generating () {
#  if [[ ! -f .rake_tasks ]]; then return 0;
#  else
#    return $([[ Rakefile -nt .rake_tasks ]])
#  fi
#}

#_rake () {
#  if [[ -f Rakefile ]]; then
#    if _rake_does_task_list_need_generating; then
#      echo "\nGenerating .rake_tasks..." >&2
#      rake --silent --tasks | cut -d " " -f 2 | sed 's/\[.*\]//g' >| .rake_tasks
#    fi
#    compadd $(<.rake_tasks)
#  fi
#}

###
# Prompt
###
setopt prompt_subst # enable to set escape sequence
#PROMPT='${WINDOW:+"[$WINDOW]"}%{$fg[cyan]%}%#%{$reset_color%} '
#PROMPT='%{$fg[white]%}%~%{$fg[cyan]%}:%{$fg[white]%}%!%{$reset_color%}'
#if [[ -r /proc/loadavg ]]; then
#    PROMPT='%{$(load_avg)%}%m%{$reset_color%}'$PROMPT
#else
#    PROMPT='%m'$PROMPT
#fi

###
# keybord-history
###
HISTFILE=$HOME/.zsh-history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
setopt share_history
setopt hist_ignore_dups hist_ignore_space
function history-all { history -E 1 } # 全履歴の一覧を出力する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

###
# バージョン管理
###
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

###
# view vim
###
#if [ -x `which vim` ];  then
#    alias vi='/usr/bin/vim'
#    alias view='/usr/bin/vim -R'
#fi
alias vi='/usr/bin/vim'

##
# rvm
##
#[[ -s "/home/yamak/.rvm/scripts/rvm" ]] && source "/home/yamak/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##
# android
##
#export PATH=~/Data/android/adt-bundle-mac-x86_64/sdk/platform-tools:$PATH

## alias
#alias pv='perl -le '"'"'for $module (@ARGV) { eval "use $module"; print "$module ", ${"${module}::VERSION"} }'"'"
#alias sc='/usr/local/Cellar/screen/HEAD/bin/screen'
#alias rake_db_reload="rake db:drop && rake db:create && rake db:migrate && rake db:seed && rake db:migrate RAILS_ENV=test"

export SVN_EDITOR=vim
#export GIT_PROXY_COMMAND=/Users/yamakawa_toru/etc/git-proxy.sh
#export ANDROID_SDK=/Users/yamakawa_toru/Data/android/adt-bundle-mac-x86_64/sdk
#export PROGUARD_HOME=/Users/yamakawa_toru/Data/android/adt-bundle-mac-x86_64/sdk/tools/proguard
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8'
#export PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick/6.8.0-10/lib/pkgconfig/
#export PERL_CPANM_OPT="--local-lib=~/perl5"
unset SSH_ASKPASS

alias ll='ls -l'

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

eval "$(rbenv init -)"

# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# history
SAVEHIST=100000

# vim bindings
bindkey -v

fpath=( "$HOME/.zfunctions" $fpath )

# antigen time!
source ~/Repositories/antigen/antigen.zsh

######################################################################
### install some antigen bundles

local b="antigen-bundle"

# Don't load the oh-my-zsh's library. Takes too long. No need.
antigen use oh-my-zsh

# Guess what to install when running an unknown command.
$b command-not-found

# Helper for extracting different types of archives.
$b extract

# atom editor
#$b atom

# homebrew  - autocomplete on `brew install`
#$b brew
#$b brew-cask

# Tracks your most used directories, based on 'frecency'.
#$b robbyrussell/oh-my-zsh plugins/z

# nicoulaj's moar completion files for zsh -- not sure why disabled.
# $b zsh-users/zsh-completions src

# Syntax highlighting on the readline
$b zsh-users/zsh-syntax-highlighting

# history search
$b zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# suggestions
$b tarruda/zsh-autosuggestions

# colors for all files!
$b trapd00r/zsh-syntax-highlighting-filetypes

# dont set a theme, because pure does it all
$b mafredri/zsh-async
#$b sindresorhus/pure

# Sudo
$b sudo

# History
$b history

# Git
$b git

# Git extras
$b git-extras

# Jira
$b jira

# Tip alias
$b djui/alias-tips

# Pastebin sprunge
$b sprunge

# Oh my git
#$b arialdomartini/oh-my-git
#antigen theme arialdomartini/oh-my-git-themes arialdo-pathinline

# Tell antigen that you're done.
antigen apply

###
#################################################################################################

# Zsh git prompt
source ~/Repositories/zsh-git-prompt/zshrc.sh
source ~/.zsh-git-prompt

# bind UP and DOWN arrow keys for history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# config for suggestions
#AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

export PURE_GIT_UNTRACKED_DIRTY=0

# Automatically list directory contents on `cd`.
auto-ls () {
	emulate -L zsh;
	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
#chpwd_functions=( auto-ls $chpwd_functions )

# Enable autosuggestions automatically
# zle-line-init() {
#     zle autosuggest-start
# }
#zle -N zle-line-init

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# uncomment to finish profiling
# zprof

# Load default dotfiles
source ~/.bash_profile

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Perl
PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

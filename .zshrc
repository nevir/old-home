# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Case-sensitive tab completion.
CASE_SENSITIVE="true"

# Let me set my own terminal titles, thank you very much.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew gem git heroku knife npm pip rake redis-cli sublime)

# Homebrew takes precedence; we also set our path up before loading Oh My ZSH so that
# it can pick up on homebrew-installed binaries
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

source $ZSH/oh-my-zsh.sh

# Stop co-opting `!`, I'd rather have more exciting comments without launching vim!
setopt nobanghist

# Autocorrect is annoying as hell.
unsetopt correct_all

# Ruby's default GC settings aren't tuned for heavy usage.
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# nvm!
if [[ -e ~/.nvm/nvm.sh ]]; then
  source ~/.nvm/nvm.sh
fi

# Expose Python.framework modules to other Pythons, too.
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Ack all the things!
alias ack="ack -a"

# ALways have a 1.9 rubinius
export RBXOPT=-X19

# chruby
if [[ -d /usr/local/opt/chruby/ ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
  chruby 2.0.0
fi

# Allow local path bins to take control
export PATH=bin:$PATH

# `hub`
if [[ -e `which hub` ]]; then
  eval "$(hub alias -s)"
  source /usr/local/share/zsh/site-functions/_hub
fi

# Ugh, go loves a global env.
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

# Do any custom/private stuff
if [[ -e ~/.zshrc.personal ]]; then
  source ~/.zshrc.personal
fi

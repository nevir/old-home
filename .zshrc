# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Case-sensitive tab completion.
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew bundler gem git heroku knife npm pip rbenv redis-cli sublime)

# Homebrew takes precedence; we also set our path up before loading Oh My ZSH so that
# it can pick up on homebrew-installed binaries
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

source $ZSH/oh-my-zsh.sh

# the bundler and rake plugins don't coexist nicely; I need to submit a patch!
alias rake="noglob bundled_rake"

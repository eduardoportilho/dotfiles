# No greetings, please
set fish_greeting

# Set OS variable
set osname (uname -s)
if [ $osname = "Darwin" ]
    set -x OS "OSX"
else
    set -x OS "Linux"
end

# Load custom functions
for path in $OMF_CONFIG/custom/*
	source $path ^/dev/null
end

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
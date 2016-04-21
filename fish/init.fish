# No greetings, please
set fish_greeting

# Set OS variable
set uname (uname -s)
if uname = "Darwin"
    set -x OS "OSX"
else
    set -x OS "Linux"
end

# Load custom functions
for path in $OMF_CONFIG/custom/*
	source $path ^/dev/null
end
################################
#
# Aliases and common functions
#

set message "Aliases:"

################################
# Perfect ls

function ll
    ls -la $argv
end
alias md "mkdir $argv; and cd $argv"
set message $message" ll, md"

################################
# website - cache clear

alias cclear "sudo rm -rf ~/src/website/Symfony/app/cache/dev/; and sudo chmod -R a+w ~/src/website/Symfony/app/cache"
set message $message", cclear"

################################
# website - tail

alias tailb "tail -f /spotify/log/apache2/"(hostname)"-error.log | grep"
set message $message", tailb"

if [ $OS = "Linux" ]

    ################################
    # Fast(er) devify

    alias devf "/src/website/devify.sh --auto --skip-static --skip-npm --skip-language --skip-cms --setup-permissions"
    set message $message", devf"

end

if [ $OS = "OSX" ]

    ################################
    # Show and hide hidden files on Finder

    alias findershow 'defaults write com.apple.finder AppleShowAllFiles YES ; killall Finder'
    alias finderhide 'defaults write com.apple.finder AppleShowAllFiles NO ; killall Finder'

    ################################
    # Simple HTTP server
    
    alias serve 'python -m SimpleHTTPServer 8000'
    set message $message", serve"

end

echo $message
################################
#
# Aliases and common functs
#

set message "Aliases:"

################################
# Perfect ls

function ll
    ls -la $argv
end
set message $message" ll"

################################
# website - cache clear

alias cclear "sudo rm -rf ~/src/website/Symfony/app/cache/dev/; and sudo chmod -R a+w ~/src/website/Symfony/app/cache"
set message $message", cclear"

################################
# website - tail

alias tailb "tail -f /spotify/log/apache2/"(hostname)"-error.log | grep Backend"
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
    set message $message", findershow, finderhide"

end

echo $message
################################
#
# Aliases and common functs
#

set message "Aliases:"

# perfect ls
function ll
    ls -la $argv
end
set message $message" ll"

if [ $OS = "Linux" ]
    # Fast(er) devify
    alias devf "/src/website/devify.sh --auto --skip-static --skip-npm --skip-language --skip-cms --setup-permissions"
    set message $message", devf"
end

if [ $OS = "OSX" ]
    # show and hide hidden files on Finder
    alias findershow 'defaults write com.apple.finder AppleShowAllFiles YES ; killall Finder'
    alias finderhide 'defaults write com.apple.finder AppleShowAllFiles NO ; killall Finder'
    set message $message", findershow, finderhide"
end

echo $message
################################
#
# Aliases and common functions
#

set message "[$OS] Aliases:"

################################
# General

function ll
    ls -la $argv
end

function md
	mkdir $argv
	cd $argv
end

set message $message" hlp, ll, md"

################################
# Fish specific

alias fishrst "source ~/.config/fish/config.fish"
alias gobash "exec /bin/bash -l"
alias herokud "git add . ; and git commit -a --amend -C HEAD ; and git push -f heroku master"
alias spm "npm -reg http://npm-registry.spotify.net"

set message $message", fishrst, gobash, herokud, spm"

if [ $OS = "Linux" ]

    ################################
    # Fast(er) devify

    alias devf "~/src/website/devify.sh --auto --skip-static --skip-npm --skip-language --skip-cms --setup-permissions"
    set message $message", devf"


    ################################
    # website - cache clear

    function cachezap
        if test -d ~/src/website/Symfony/app/cache/dev
            sudo rm -rf ~/src/website/Symfony/app/cache/dev/*
        end

        if not test -d ~/src/website/Symfony/app/cache
            mkdir ~/src/website/Symfony/app/cache
        end

        sudo chmod -R a+rwX ~/src/website/Symfony/app/cache
        sudo chown -R $USER:www-data ~/src/website/Symfony/app/cache
    end
    set message $message", cachezap"


    ################################
    # website - tail

    alias logs "tail -f /spotify/log/apache2/"(hostname)"-error.log | grep -v \"deprecated\" | grep -i"
    set message $message", logs"

end

if [ $OS = "OSX" ]

    ################################
    # Show and hide hidden files on Finder

    alias findershow 'defaults write com.apple.finder AppleShowAllFiles YES ; killall Finder'
    alias finderhide 'defaults write com.apple.finder AppleShowAllFiles NO ; killall Finder'
    set message $message", findershow, finderhide"

    ################################
    # Simple HTTP server

    alias serve 'python -m SimpleHTTPServer 8000'
    set message $message", serve"

    ################################
    # Misc
    alias srct "open -a SourceTree"
    set message $message", srct"


end

set -x -g help_message $message
echo $help_message

function hlp
    echo $help_message
end
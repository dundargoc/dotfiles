function gopen
    set url (git config --get remote.origin.url)
    set url (string replace "git@" "" $url)
    set url (string replace ":" "/" $url)
    set url (string replace ".git" "" $url)
    chrome $url
end

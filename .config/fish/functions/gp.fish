function gp
    set url (git config --get remote.origin.url)
    if string match -r -q -- "gerrit" $url
        git push origin HEAD:refs/for/master
    else
        git push --quiet
    end
end

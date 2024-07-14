function create
    set current_branch (git rev-parse --abbrev-ref HEAD)
    set default_branch (gh-default-branch)
    set origin_url (git config --get remote.origin.url)

    if [ $current_branch = $default_branch ]
        echo "Currently on default branch. Abort..."
        return
    end

    if string match -q -- "*neodundar*" $origin_url
        gps
        set repo_name (basename (git rev-parse --show-toplevel))
        gh pr create --fill -R neodundar/$repo_name
        return
    end

    gps
    gh pr create --fill --draft
end

function rev
    set repo_path (git rev-parse --show-toplevel)
    reset

    if [ $repo_path != $HOME/programs/neovim ]
        echo "Not in neovim repo. Abort."
        return
    end

    # 0-17000 done
    for i in (seq 16100 17000)
        if gh api --cache 24h /repos/{owner}/{repo}/pulls/$i &>/dev/null
            set state (gh api --cache 24h /repos/{owner}/{repo}/pulls/$i --jq '.state')
            if [ $state = closed ]
                set user (gh api --cache 24h /repos/{owner}/{repo}/pulls/$i/requested_reviewers --jq '.users.[].login')
                if test -n "$user"
                    #echo "$i $user"
                    chrome https://github.com/neovim/neovim/pull/$i
                end
            end
        end
    end
end

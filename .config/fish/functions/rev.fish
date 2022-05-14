function rev
    set repo_path (git rev-parse --show-toplevel)
    reset

    if [ $repo_path != $HOME/programs/neovim ]
        echo "Not in neovim repo. Abort."
        return
    end

    # 13000-15000 done
    for i in (seq 15000 16000)
        if gh api --cache 100h /repos/{owner}/{repo}/pulls/$i &>/dev/null
            set state (gh api --cache 24h /repos/{owner}/{repo}/pulls/$i --jq '.state')
            if [ $state = closed ]
                set user (gh api --cache 24h /repos/{owner}/{repo}/pulls/$i/requested_reviewers --jq '.users.[].login')
                if test -n "$user"
                    echo "$i $user"
                end
            end
        end
    end
end

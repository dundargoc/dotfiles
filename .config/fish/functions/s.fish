function s
    set repo_path (git rev-parse --show-toplevel)
    set repo_name (basename $repo_path)

    gh repo sync dundargoc/$repo_name
    git -C $repo_path fetch --tags --force --prune
    git -C $repo_path pull --rebase --all
end

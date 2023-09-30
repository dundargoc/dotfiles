function s
    set repo_path (git rev-parse --show-toplevel)
    set repo_name (basename $repo_path)
    set default_branch (gh-default-branch)

    git -C $repo_path fetch origin --tags --force --prune
    git -C $repo_path pull

    if git ls-remote --exit-code upstream &>/dev/null
        git -C $repo_path fetch upstream $default_branch --tags --force --prune
        git -C $repo_path rebase upstream/$default_branch $default_branch
    end
end

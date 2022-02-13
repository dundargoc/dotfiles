function testpr --argument-names type
    set repo_path (git rev-parse --show-toplevel)
    set branch (basename (mktemp))

    if [ $repo_path != "$HOME/programs/dundar-organization/neovim" -a $repo_path != "$HOME/programs/notdundargoc/neovim" ]
        echo "Attempting dangerous command outsite of intended area. Abort"
        return 1
    end

    if [ -z "$type" ]
        set type chore
    end

    git checkout -b $branch

    pushd $repo_path
    touch flerp
    popd

    git add -A
    git commit -m "$type: quick update, squash later"
    git push --set-upstream origin (git branch --show-current)
    gh pr create --fill
    git switch (gh-default-branch)
end

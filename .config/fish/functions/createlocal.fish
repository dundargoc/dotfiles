function createlocal
    gps
    set repo_name (basename (git rev-parse --show-toplevel))
    gh pr create --fill -R dundargoc/$repo_name
end

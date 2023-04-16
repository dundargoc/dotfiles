function createlocal
    gps
    set repo_name (basename (git rev-parse --show-toplevel))
    gh pr create --fill -R neodundar/$repo_name
end

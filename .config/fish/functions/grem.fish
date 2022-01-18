function grem
  set default_branch (git rev-parse --abbrev-ref origin/HEAD | sed 's|origin/||')
  git rebase $default_branch
end

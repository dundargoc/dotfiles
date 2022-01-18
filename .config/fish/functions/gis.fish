function gis --wraps "git switch"
  if count $argv > /dev/null
    git switch $argv
  else
    set default_branch (git rev-parse --abbrev-ref origin/HEAD | sed 's|origin/||')
    git switch $default_branch
  end
end

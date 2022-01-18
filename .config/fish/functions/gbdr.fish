function gbdr -w "git push origin --delete"
  set branch (string replace "origin/" "" $argv)
  git push origin --delete $branch
end

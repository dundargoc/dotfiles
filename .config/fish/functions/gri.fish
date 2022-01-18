function gri --argument-names 'number'
  if test -n "$number"
    git rebase -i HEAD~$number
  else
    git rebase -i HEAD~10
  end
end

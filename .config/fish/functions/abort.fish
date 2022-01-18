function abort
  if git bisect log &>/dev/null
    git bisect reset
  else
    git rebase --abort &>/dev/null
  end
end

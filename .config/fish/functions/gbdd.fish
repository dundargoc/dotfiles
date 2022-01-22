function gbdd --wraps "git branch --delete" --argument-names branch
    git push origin --delete $branch
    git branch -D $branch
end

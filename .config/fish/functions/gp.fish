function gp
    if git remote | grep -w review
        git push review
    else
        git push --quiet
    end
end

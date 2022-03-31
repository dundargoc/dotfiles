function fix --argument-names commit
    git add -A
    git commit --no-verify --allow-empty --fixup="$commit"
end


function gauth
    git for-each-ref --format='%(authorname)' | sort | uniq -c | sort -n
end

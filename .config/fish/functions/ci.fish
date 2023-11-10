function ci
    set repo_path (git rev-parse --show-toplevel)
    rm -f $repo_path/.cirrus.yml $repo_path/.github/workflows/{api-docs.yml,build.yml,codeql.yml,test.yml}
    git add -A
    git commit -m "fixup: TESTING - REMOVE COMMIT LATER"
end

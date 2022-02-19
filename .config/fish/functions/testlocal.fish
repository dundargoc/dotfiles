function testlocal
    set branch "_test-branch"
    git push origin --delete $branch
    git branch -D $branch

    git checkout -b $branch

    touch .test-file

    git add -A
    git commit -m 'ci-test: pull request test'

    createlocal

    git switch (gh-default-branch)
end

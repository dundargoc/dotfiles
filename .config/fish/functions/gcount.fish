function gcount
    git rev-list --count $argv[1]..$argv[2]
    git rev-list --count $argv[2]..$argv[1]
end

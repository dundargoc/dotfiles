function gcl
    if string match -r -q -- "^(ssh|https)://" $argv
        git clone $argv
        if string match -r -q -- "^ssh://gerrit" $argv
            set name (string split "/" $argv)[-1]
            cd $name
            set git_path (git rev-parse --git-dir)
            mkdir -p $git_path/hooks/
            curl -fLo $git_path/hooks/commit-msg https://gerrit.neo.volvocars.net/tools/hooks/commit-msg
            chmod +x $git_path/hooks/commit-msg
        end
    else
        gh repo clone $argv[1] -- $argv[2..]
    end
end

function gcl
    if string match -r -q -- "^(ssh|https)://" $argv
        git clone $argv
    else
        gh repo clone $argv[1] -- $argv[2..]
    end
end

function gcl
    if string match -r -q -- "^(ssh|https)://" $argv
        git clone --recursive $argv
    else
        gh repo clone $argv[1] -- --recursive $argv[2..]
    end
end

function fish-profile
    fish --profile-startup /tmp/fish.profile -i -c exit
    sort -nk2 /tmp/fish.profile
end

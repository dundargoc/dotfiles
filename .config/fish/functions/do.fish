function do
    if count $argv >/dev/null
        set image_name "$argv"
    else
        set image_name docker-test
    end

    docker build -t "$image_name" .
    docker run --rm -ti "$image_name"
end

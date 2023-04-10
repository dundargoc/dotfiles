function do
    if count $argv >/dev/null
        set image_name "$argv"
    else
        set image_name docker-test
    end

    podman build -t "$image_name" . && podman run --rm -ti "$image_name"
end

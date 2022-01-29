# Set variable for both global and universal scope.
function superset
    set -gx $argv[1] $argv[2..]
    set -Ux $argv[1] $argv[2..]
end

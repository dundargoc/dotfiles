# Create gh aliases. This only needs to be done once so ideally it should only
# be in a setup script instead of a function.

function gh-setup
    gh alias set create 'pr create --fill'
    gh extension install dlvhdr/gh-dash
end

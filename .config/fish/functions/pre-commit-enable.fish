function pre-commit-enable
	set root (git rev-parse --show-toplevel)
	set hook_path $root/.git/hooks
	mv $hook_path/pre-commit-disable $hook_path/pre-commit
end

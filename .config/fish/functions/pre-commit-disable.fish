function pre-commit-disable
	set root (git rev-parse --show-toplevel)
	set hook_path $root/.git/hooks
	mv $hook_path/pre-commit $hook_path/pre-commit-disable
end

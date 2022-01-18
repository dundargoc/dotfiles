function build-vim
	cd "$HOME/programs/vim" >/dev/null
	touch src/**/*
	bear -- make -j
end

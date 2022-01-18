function buildinstall
	set neovim_path "$HOME/programs/neovim"

	make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path" CMAKE_BUILD_TYPE=RelWithDebInfo
	make -C "$neovim_path" install
end

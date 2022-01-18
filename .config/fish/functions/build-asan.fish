function build-asan
	set neovim_path "$HOME/programs/neovim"

	make -C "$neovim_path" CMAKE_INSTALL_PREFIX="$neovim_path" CMAKE_EXTRA_FLAGS="-DCMAKE_C_COMPILER=clang -DCLANG_ASAN_UBSAN=1" CMAKE_BUILD_TYPE=RelWithDebInfo
  make -C "$neovim_path" install

end

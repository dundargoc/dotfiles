function fishinstall
	set fish_path "$HOME/programs/fish-shell"
	set fish_build_path "$fish_path/build"

  cmake -S $fish_path -B $fish_build_path -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release -G 'Ninja' -DCMAKE_INSTALL_PREFIX="$fish_path"
  cmake --build $fish_build_path

  command cp $fish_build_path/compile_commands.json $fish_path

	make -C "$fish_path" install
end

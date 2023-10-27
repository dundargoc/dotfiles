{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dundargoc";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "23.05"; # This should apparently never be changed.

  home.packages = with pkgs; [
    asciinema
    atool
    ccache
    codespell
    colima
    cppcheck
    docker
    doxygen
    fd
    gettext
    gh
    git
    git-absorb
    gnused
    hyperfine
    just
    kitty
    ninja
    pkg-config
    python311Packages.compiledb
    python311Packages.vulture
    ripgrep
    scc
    shellcheck
    typos
    wget
    xclip
    zig
  ];

  programs = {
      home-manager.enable = true;
  };

}

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
    bash
    ccache
    codespell
    colima
    cppcheck
    docker
    dos2unix
    doxygen
    fd
    gettext
    gh
    git
    git-absorb
    git-cliff
    gnused
    hyperfine
    jq
    just
    kitty
    ninja
    patch
    pkg-config
    python311Packages.compiledb
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

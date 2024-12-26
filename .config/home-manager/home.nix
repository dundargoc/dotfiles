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
    black
    ccache
    codespell
    colima
    cppcheck
    docker
    dos2unix
    fd
    gh
    git
    git-absorb
    gnused
    hyperfine
    jq
    lua51Packages.luarocks
    ninja
    nodePackages.prettier
    patch
    pkg-config
    ripgrep
    scc
    shellcheck
    typos
    wget
    xclip
  ];

  programs = {
      home-manager.enable = true;
  };

}

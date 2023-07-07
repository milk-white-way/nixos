{ config, pkgs, ... }:
# Settings for Home Manger configuration
{
  home = {
    username = "milk-white-way";
    homeDirectory = "/home/milk-white-way";
  };

  programs.git = {
    enable = true;
    userName = "milk-white-way";
    userEmail = "tam.thien.nguyen@ndus.edu";
  };

  home.packages = with pkgs; [
    bat
    btop
    firefox
    nnn
  # wayland
    mako
    wl-clipboard
  # dev environments
    lazygit
    nodejs
    python3
    python3Packages.pip
    rustup
    zig
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}

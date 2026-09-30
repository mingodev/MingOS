{ pkgs, ... }:
{
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  imports = [
    ./common/fonts.nix
    ./common/hyprland.nix
  ];
}

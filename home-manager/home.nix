{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use other home-manager modules:
    # inputs.self.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    # TODO : Include specific configurations here (nvim, hyprland, etc)
  ];

  nixpkgs = {
    overlays = [
       inputs.self.overlays.additions
       inputs.self.overlays.modifications
       inputs.self.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.hyprland.enable = true;

  # TODO : Add programs here

  systemd.user.startServices = "sw-switch";
  home.stateVersion = "23.05";
}

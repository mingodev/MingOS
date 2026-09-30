{ config, lib, pkgs, hostname, ... }:
{
  imports = [     
    ./common-packages.nix
    ./modules/greeter/default.nix
    ./modules/shell/default.nix
    ./modules/terminal/default.nix
  ];

  config = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    time.timeZone = "America/Toronto";
    i18n.defaultLocale = "en_CA.UTF-8";

    nixpkgs.config.allowUnfree = true;

    users.users = import ./users.nix;

    # TODO : Create hyprland module
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    
    system.stateVersion = "25.11"; 
  };
}

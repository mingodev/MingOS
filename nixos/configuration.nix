{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
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

  nix = let
    flakeinputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      # Disable registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };

    networking.hostName = "mingodev-laptop";

    users.user = {
      initialPassword = "$123qwerty";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
	# TODO : Add public SSH key here
      ];
      extraGroups = ["wheel"];
    };

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    
    virtualisation.docker.enable = true;
    
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    security.pam.services.swaylock.text = ''
      auth include login
    '';

    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
	PasswordAuthentication = false;
      };
    };
   
    # https://nixos.wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "23.05";

  };
}

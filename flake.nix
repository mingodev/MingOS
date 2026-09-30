{
  description = "Mingo's NixOS config";
  inputs = {
    # Flakes
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    mkHostConfig = hostname : lib.nixosSystem {
      inherit system;
      specialArgs = { inherit hostname; };
      modules = [
	./nixos/configuration.nix
	./hosts/${hostname} 
	home-manager.nixosModules.home-manager
	{
          networking.hostName = hostname;
	  home-manager = {
            useGlobalPkgs = true;
	    useUserPackages = true;
		
	    backupFileExtension = "backup_";
	    extraSpecialArgs = { inherit inputs; };
	    
	    users.mingodev = import ./home-manager/mingodev.nix;
	    users.mingogamer = import ./home-manager/mingogamer.nix;
	    users.guest = import ./home-manager/guest.nix;
	  };
	}
      ];
    };
  in {
    nixosConfigurations = {
      mingolap = mkHostConfig "mingolap";
      mingodesk = mkHostConfig "mingodesk";
    };
  };
}

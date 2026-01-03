{
  description = "Mingodev's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { 
    self,
    nixpkgs, 
    home-manager, 
    ... 
  } @ inputs: let 
    host = "mingodev-laptop";
    username = "mingodev";
    supportedSystems = [
	    "aarch64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

  in { 
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system}); 
    formatter = forAllSystems (system: "nixpkgs.legacyPkgs.{$system}.alejandra");
    
    overlays = import ./overlays {inherit inputs;};
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      "mingodev-laptop" = nixpkgs.lib.nixosSystem {
	
	    specialArgs = {inherit inputs;};

        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      # TODO : Find cleaner way to get packages
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}

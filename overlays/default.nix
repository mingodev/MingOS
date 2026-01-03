{inputs, ...}: {
  additions = final: _prev: import ../pkgs final.pkgs;
  
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
    	system = final.system;
	config.allowUnfree = true;
    };
  };
}

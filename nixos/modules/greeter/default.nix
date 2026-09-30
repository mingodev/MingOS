{ lib, config, ... }:

with lib;

let
  greeterModule = config.modules.greeter;
in
{
  options.modules.greeter = {
    displayManager = mkOption {
      type = types.enum [ "greetd" "sddm" ];
      default = "greetd";
      description = "Determines which greeter the host uses.";
    };
  };

  imports = [ 
    ./sddm.nix 
    ./greetd.nix
  ];
}

{ config, lib, ... }:

with lib;

let
  shellModule = config.modules.shell;
in
{ 
  options.modules.shell.interpreter = mkOption {
    type = types.enum [ "fish" "zsh" ];
    default = "fish";
    description = "Determines which shell interpreter the host uses.";
  };

  options.modules.shell.theme = mkOption {
    type = types.str;
    default = "robbyrussell";
    description = "Determines which shell theme the host uses.";
  };

  imports = [
    ./fish.nix
    ./zsh.nix
  ];
}

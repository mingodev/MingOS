{ lib, config, ... }:

with lib;

let
  terminalModule = config.modules.terminal.emulator;
in
{
  options.modules.terminal = {
    emulator = mkOption {
      type = types.enum [ "kitty" "alacritty" ];
      default = "kitty";
      description = "Determines which terminal emulator the host uses.";
    };
    theme = mkOption {
      type = types.enum [ "Catppuccin-Macchiato" "rosepyne" ];
      default = "Catppuccin-Macchiato";
      description = "Determines the terminal theme the host uses.";
    };
  };

  imports = [
    ./kitty.nix
    ./alacritty.nix
  ];
}

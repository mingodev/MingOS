{ lib, config, pkgs, ... }:
let
  shell = config.modules.shell.interpreter;
in
{

  environment.systemPackages = with pkgs; [
    kitty
  ];

  config.programs.kitty = {
    enable = true;

    font = {
      name = "Hack Nerd Font";
      size = 12;
    };

    theme = "Catppuccin-Macchiato";
    
    shellIntegration = {
      enableZshIntegration = shell == "zsh";
      enableFishIntegration = shell == "fish";
    };
  };

  environment.sessionVariables = {
    TERMINAL = "kitty";
  };

}

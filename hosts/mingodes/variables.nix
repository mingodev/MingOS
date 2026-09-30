{ config, ... }:
{
  imports = [ ../common/variables.nix ];

  # VARIABLES

  ### Git settings
  vars.gitUsername = "mingodev";
  vars.gitEmail = "simdomingo@gmail.com"; 
  vars.isWork = true;

  # MODULES

  ### Greeter
  modules.greeter.displayManager = "sddm"; 
  modules.greeter.theme = "sugar-dark";

  ### Shell
  modules.shell.interpreter = "zsh";
  modules.shell.theme = "robbyrussell"; # TODO : Set to powerlevel10k
}

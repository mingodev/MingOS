{ lib, config, pkgs, ... }:

with lib;

{
  config = mkIf (config.modules.shell.interpreter == "fish") {
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    environment.systemPackages = with pkgs; [
      fishPlugins.done
      fishPlugins.fzf-fish
      fishPlugins.forgit
      fishPlugins.tide
      fishPlugins.autopair
      fishPlugins.hydro
    ];
  };  
}

{ lib, config, pkgs, hostname, ... }:

with lib;

{
  config = mkIf (config.modules.shell.interpreter == "zsh") {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      promptInit = "";
      shellAliases = import ../../../hosts/${hostname}/shellAliases.nix;
      ohMyZsh = {
        enable = true;
	plugins = [ "git" "z" ];
	theme = config.modules.shell.theme;
      };
    };

    users.defaultUserShell = pkgs.zsh;
    environment.shells = with pkgs; [ zsh ];
  };  
}

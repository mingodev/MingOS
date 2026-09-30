{ lib, config, pkgs, ... }:

with lib;

{
  config = mkIf (config.modules.greeter.displayManager == "greetd") {

    services.seatd.enable = true;

    services.greetd = {
      enable = true;

      settings = {
        default_session = {
	  command = ''
	    ${pkgs.greetd.tuigreet}/bin/tuigreet \
	    --sessions ${pkgs.xdg-desktop-portal}/share/xsessions
	    --time \
	    --remember \
	    --cmd Hyprland
	  '';

	  user = "mingodev";
	};
      };
    };
  };
}

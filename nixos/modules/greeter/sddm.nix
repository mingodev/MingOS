{ config, lib, pkgs, ... }:

with lib;

let
  themes = {
    sddm-chili = pkgs.callPackage ./pkgs/sddm-theme-chili.nix {};
    sugar-dark = pkgs.callPackage ./pkgs/sddm-theme-sugar-dark.nix {};
  };

  selectedTheme = themes.${config.modules.greeter.theme};
in
{
  options.modules.greeter.theme = mkOption {
    type = types.enum [ "sddm-chili" "sugar-dark" ];
    default = "sddm-chili";
    description = "Which greeter theme to use.";
  };

  config = mkIf (config.modules.greeter.displayManager == "sddm") {
    # environment.systemPackages = [ themes.sddm-chili themes.sugar-dark ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${selectedTheme}";
      extraPackages = with pkgs; [
        selectedTheme

        qt6.qt5compat
        qt6.qtdeclarative
        qt6.qtsvg
        qt6.qtshadertools 
      ];
    };
  };
}

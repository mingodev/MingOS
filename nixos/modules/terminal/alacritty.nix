{ lib, config, pkgs, ... }:
# let
#   shell = config.modules.shell.interpreter;
# in
{
  environment.systemPackages = [
    pkgs.alacritty
  ];

  # config.programs.alacritty = {
  #   enable = true;
  #
  #   settings = {
  #     window = {
  #       opacity = 0.95;
  #     };
  #
  #     font = {
  #       normal = {
  #         family = "Hack Nerd Font";
  #         style = "Regular";
  #       };
  #
  #       size = 12;
  #     };
  #
  #     colors = {
  #       primary = {
  #         background = "0x24273a";
  #         foreground = "0xcad3f5";
  #       };
  #     };
  #
  #     shell = lib.mkIf (shell == "zsh") {
  #       program = "${pkgs.zsh}/bin/zsh";
  #     };
  #   };
  # };
  #
  # environment.sessionVariables = {
  #   TERMINAL = "alacritty";
  # };
}

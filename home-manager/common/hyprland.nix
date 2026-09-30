{ inputs, pkgs, ... }:
{
  imports = [ inputs.hyprland.homeManagerModules.default ]; 

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      
      env = [
      	"XCURSOR_THEME,Adwaita"
	"XCURSOR_SIZE,24"
	"HYPRCURSOR_THEME,Adwaita"
	"HYPRCURSOR_SIZE,24"
        "WLR_NO_HARDWARE_CURSORS=1"
      ];

      exec-once = [
	"${pkgs.waybar}/bin/waybar"
	"${pkgs.mako}/bin/mako"
      ];

      monitor = [
	"eDP-1,1920x1080@60,1465x0,1.33"
	"DP-1, 1920x1080@144,0x-1280,1.2,transform,1"
	"HDMI-A-1,2560x1080@120,900x-1080,1" 
      ];

      bind = [
        "$mod, Q, exec, ${pkgs.kitty}/bin/kitty"
	"$mod, R, exec, ${pkgs.wofi}/bin/wofi --show drun"
	"$mod, C, killactive"
	"$mod, P, pseudo,"
	"$mod, S, togglesplit,"
	"$mod, V, togglefloating,"
	"$mod, left, movefocus, l"
	"$mod, down, movefocus, d"
	"$mod, up, movefocus, u"
	"$mod, right, movefocus, r"
	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod, 6, workspace, 6"
	"$mod, 7, workspace, 7"
	"$mod, 8, workspace, 8"
	"$mod, 9, workspace, 9"
	"$mod, 0, workspace, 10"
	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod SHIFT, 6, movetoworkspace, 6"
	"$mod SHIFT, 7, movetoworkspace, 7"
	"$mod SHIFT, 8, movetoworkspace, 8"
	"$mod SHIFT, 9, movetoworkspace, 9"
	"$mod SHIFT, 0, movetoworkspace, 10"
      ];

      bindm = [
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];

      general = {
        gaps_in = 5;
	gaps_out = 10;
      };

      animations = {
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
	animation = [
          "windows, 1, 7, myBezier"
	  "windowsOut, 1, 7, default, popin 80%"
	  "border, 1, 10, default"
	  "borderangle, 1, 8, default"
	  "fade, 1, 7, default"
	  "workspaces, 1, 6, default"
	];
      };

      dwindle = {
        pseudotile = "yes";
	preserve_split = "yes";
      };


      misc.disable_hyprland_logo = true;
      cursor.no_warps = false;
    };
  };
}

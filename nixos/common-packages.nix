{ pkgs, ... } : {
  environment.systemPackages = with pkgs; [
    brave
    cava
    git
    grip-search
    man
    mako
    neovim
    networkmanagerapplet
    pipewire
    swaylock
    neofetch
    waybar
    wget
    wofi
  ];
}

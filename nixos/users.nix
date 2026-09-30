{
  mingodev = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" ];
  };
  mingogamer = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
  guest = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" ];
  };
}

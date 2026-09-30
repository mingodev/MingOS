{ ... }: {
  home.username = "guest";
  home.homeDirectory = "/home/guest";
  imports = [ ../home.nix ];
}

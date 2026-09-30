{ ... }: {
  home.username = "mingodev";
  home.homeDirectory = "/home/mingodev";
  imports = [ ../home.nix ];
}

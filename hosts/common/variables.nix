{ lib, ... }:
{
  options.vars = with lib.types; {
    gitEmail = lib.mkOption {
      type = str;
      description = "Github account email";
    };
    
    gitUsername = lib.mkOption {
      type = str;
      description = "Github account username";
    };

    isWork = lib.mkOption {
      type = bool;
      default = false;
      description = "Whether this host is used for work or personnal business";
    };
  };
}

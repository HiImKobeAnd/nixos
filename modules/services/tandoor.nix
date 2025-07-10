{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.tandoor.enable {
    environment.systemPackages = with pkgs; [
      tandoor-recipes
    ];
    services.tandoor-recipes = {
      enable = true;
      port = 8320;
      # database.createLocally = true;
    };
  };
}

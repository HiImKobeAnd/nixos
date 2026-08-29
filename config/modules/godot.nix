{ ... }:
{
  flake.nixosModules.godot =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.godot ];
    };
}

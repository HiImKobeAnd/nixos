{ ... }:
{
  flake.nixosModules.aicode = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      opencode
      mistral-vibe
    ];
  };
}

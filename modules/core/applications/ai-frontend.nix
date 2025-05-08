{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.applications.ai-frontend.enable {
    environment.systemPackages = with pkgs; [
      #private-gpt
      #gpt4all-cuda
    ];
  };
}

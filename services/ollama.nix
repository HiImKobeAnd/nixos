{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ollama
  ];
  services.ollama = {
    enable = false;
    acceleration = "cuda";
  };
}

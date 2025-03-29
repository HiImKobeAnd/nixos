{pkgs, ...}: {
  virtualisation.docker.enable = true;
  users.users.hiimkobeand.extraGroups = ["docker"];
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs; [
  ];
}

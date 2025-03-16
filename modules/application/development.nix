{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    umlet
    jetbrains.rider
  ];
}

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alacritty
    vscode
    umlet
  ];
}

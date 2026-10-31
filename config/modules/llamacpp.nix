_: {
  flake.nixosModules.llamacpp = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      llama-cpp-cuda
    ];
  };
}

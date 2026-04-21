dotfiles_location := "~/.dotfiles/nixos/"

switch:
    git add .
    @echo "NixOS Rebuilding..."
    nh os switch {{dotfiles_location}} --hostname {{env_var('USER')}} --diff always
    $(current=$(sudo nix-env -p /nix/var/nix/profiles/system --list-generations | grep current); \
    git commit -am "$current")

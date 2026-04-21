dotfiles_location := "~/.dotfiles/nixos/"
current_gen := `sudo nix-env -p /nix/var/nix/profiles/system --list-generations | grep current | sed 's/^[[:space:]]*//'`

default: switch

switch: _pre && _post
    nh os switch {{dotfiles_location}} --hostname {{env_var('USER')}} --diff always

reboot: _pre && _post
    nh os boot {{dotfiles_location}} --hostname {{env_var('USER')}} --diff always

_pre:
    git add .
    @echo "NixOS Rebuilding..."

_post:
    @echo "Committing generation: {{current_gen}}"
    git commit -am "{{current_gen}}"

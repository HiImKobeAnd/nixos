{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.server0Configuration = {config, ...}: let
    domain = "home.hiimkobeand.net";
    vpnIP = "100.64.0.10";
  in {
    imports = [
      self.nixosModules.server0Hardware
      self.nixosModules.default-locale
      self.nixosModules.ssh
      self.nixosModules.nextcloud
      self.nixosModules.tailscale
      inputs.sops-nix.nixosModules.sops
    ];

    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/server0/.config/sops/age/keys.txt";
      secrets."default_nextcloud_admin_pass" = {};
      secrets."cloudflare_dns_key" = {};
    };

    security.acme = {
      acceptTerms = true;
      defaults.email = "hiimkobeand@gmail.com";
      certs."${domain}" = {
        domain = "*.${domain}";
        dnsProvider = "cloudflare";
        environmentFile = config.sops.secrets."cloudflare_dns_key".path;
        dnsResolver = "1.1.1.1:53";
        group = "nginx";
      };
    };

    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      defaultListenAddresses = [vpnIP];
      virtualHosts."cloud.${domain}" = {
        forceSSL = true;
        useACMEHost = domain;
        locations."/" = {
          proxyPass = "http://127.0.0.1:80";
          proxyWebsockets = true;
        };
      };
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "server0";

    networking.networkmanager.enable = true;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    nix.settings.trusted-users = ["@wheel"];

    users.users."server0" = {
      isNormalUser = true;
      description = "server0";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKtL57ynKkB4Sul/DcDwKIX8oYEhHb3OcpWpSxEdbj5B"
      ];
    };

    security.sudo.extraRules = [
      {
        groups = ["wheel"];
        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05";
  };
}

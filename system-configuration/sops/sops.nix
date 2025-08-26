{ pkgs, inputs, config, ... }:
{
  environment.systemPackages = with pkgs; [ sops ];
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/orsell/.config/sops/age/keys.txt";
  sops.secrets.tailscale = { };
}

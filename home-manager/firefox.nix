{ inputs, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = with pkgs; [ uget-integrator ];
    profiles.n = {
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
      ];
    };
  };
}

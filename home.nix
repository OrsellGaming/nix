{ config
, pkgs
, inputs
, lib
, sops-nix
, ... }:

{
  home.username = "orsell";
  home.homeDirectory = "/home/orsell";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    alvr # VR
    sidequest
    lutris
    gale
    qbittorrent
    vpkedit
    bottles # Wine
    jdk21 # J*va
    quickemu # Easy VM management
    gimp
    uget
    mpv # Media Player
    modrinth-app
    pavucontrol # Volume Control
    kdePackages.kdenlive # Video Editor
    bs-manager # Beat Saber Mod Manager
    # Fonts
    nerd-fonts.jetbrains-mono
  ];

  imports = [
    ./home-manager/default-applications.nix
    ./home-manager/discord/nixcord.nix
    ./home-manager/hyprland/hyprland.nix
    ./home-manager/hyprland/waybar.nix
    ./home-manager/notification-daemon.nix
    ./home-manager/quickshell/quickshell.nix
    ./home-manager/steam/steam.nix
    ./home-manager/term-shell/term-shell.nix
    ./home-manager/term-shell/fastfetch/fastfetch.nix
    ./home-manager/vscode/vscode.nix
    ./home-manager/firefox.nix
    ./home-manager/git.nix
    ./home-manager/nemo.nix
    ./home-manager/nh.nix
    ./home-manager/obs.nix
    ./home-manager/rofi/rofi.nix
  ];

  # Secret Management
  #sops = {
  #  defaultSopsFile = ./system-configuration/sops/secrets/secrets.yaml;
  #  defaultSopsFormat = "yaml";
  #  defaultSymlinkPath = "/run/user/1000/secrets";
  #  defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  #  #age.keyFile = "/home/orsell/.config/sops/age/keys.txt";
  #  secrets.discord-token = { path = "${config.sops.defaultSymlinkPath}/discord-token"; };
  #};


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}

{ config
, pkgs
, inputs
, lib
, ... }:

{
  home.username = "n";
  home.homeDirectory = "/home/n";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    alvr # VR
    lutris
    gale
    qbittorrent
    vpkedit
    bottles # Wine
    jdk21 # J*va
    quickemu # Easy VM management
    gimp
    lazygit
    sidequest
    uget
    mpv # Media Player
    modrinth-app
    pavucontrol # Volume Control
    kdePackages.kdenlive # Video Editor
    bs-manager # Beat Saber Mod Manager
  ];

  imports = [
    # ./home-manager/default-applications.nix
    ./home-manager/bash.nix
    ./home-manager/firefox.nix
    ./home-manager/git.nix
    ./home-manager/kitty.nix
    ./home-manager/nh.nix
    ./home-manager/notification-daemon.nix
    ./home-manager/obs.nix
    ./home-manager/tmux.nix
    ./home-manager/yazi.nix
    ./home-manager/discord/nixcord.nix
    ./home-manager/fastfetch/fastfetch.nix
    ./home-manager/hyprland/hyprland.nix
    ./home-manager/vscode/vscode.nix
    ./home-manager/steam/steam.nix
  ];

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

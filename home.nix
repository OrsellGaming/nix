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
    lutris
    gale
    qbittorrent
    vpkedit
    bottles # Wine
    jdk21 # Java
    quickemu # Easy VM management
    gimp-with-plugins
    lazygit
    sidequest
    uget
    mpv # Media Player
    modrinth-app
    pavucontrol # Volume Control
    kdePackages.kdenlive # Video Editor
    bs-manager # Beat Saber Mod Manager
  ];

  # EXTRA VR CONFIG
  xdg.configFile."openxr/1/active_runtime.json".source = "${pkgs.wivrn}/share/openxr/1/openxr_wivrn.json";

  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "${config.xdg.dataHome}/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "${config.xdg.dataHome}/Steam/logs"
      ],
      "runtime" :
      [
        "${pkgs.opencomposite}/lib/opencomposite"
      ],
      "version" : 1
    }
  '';

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
  ];

  # packages.someDotnetApplication6 = {
  #   pkgs.buildDotnetModule rec {
  #     pname = "some_program"; version = "some_version"
  #   };

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

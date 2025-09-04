###*** THE MAIN CONFIGURATION FILE!!! ***###
#? Help is available in the configuration.nix(5) man page
#? and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }: {
  imports =
    [
      ./hardware-configuration.nix

      ./system-configuration/bootloader.nix
      ./system-configuration/cpu-power.nix
      ./system-configuration/greeter/greeter.nix
      # ./system-configuration/kde.nix
      ./system-configuration/graphics.nix
      # ./system-configuration/sddm.nix
      ./system-configuration/services.nix
      # ./system-configuration/sops/sops.nix
      ./system-applications/applications.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    # These flags are used to enable backlight control when the dGPU is working in hybrid mode
    "i915.enable_dpcd_backlight=1"
    "nvidia.NVreg_EnableBacklightHandler=0"
    "nvidia.NVReg_RegistryDwords=EnableBrightnessControl=0"

    
    "nvidia-drm.modeset=1"
  ];

  networking.hostName = "lambda-core"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.enableIPv6  = false;
  networking.nameservers = [ "1.1.1.1" ];
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = false;

  # Enable Hyprland with UWSM support.
  security.polkit.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  # Universal Wayland Session Manager
  programs.uwsm = {
    enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nix.settings = {
    auto-optimise-store = true;

    # Flakes
    experimental-features = [ "nix-command" "flakes" ];
  };
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 7d";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Define a user account.
  users.users.orsell = {
    isNormalUser = true;
    description = "Some Nerd's Account";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "libvirtd" "users" ];
  };

  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = "pinentry-gtk2";
    enableSSHSupport = true;
  };

  # Android Debug Bridge
  programs.adb.enable = true;

  # VR
  # services.wivrn = {
  #   enable = true;
  #   openFirewall = true;
  #   defaultRuntime = true;
  # # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
  #   config = {
  #     enable = true;
  #     json = {
  #       # 1.0x foveation scaling
  #       scale = 1.0;
  #       # 70 Mb/s
  #       bitrate = 70000000;
  #       encoders = [
  #         {
  #           encoder = "vulkan";
  #           codec = "h264";
  #           # 1.0 x 1.0 scaling
  #           width = 1.0;
  #           height = 1.0;
  #           offset_x = 0.0;
  #           offset_y = 0.0;
  #         }
  #       ];
  #     };
  #   };
  # };

  programs.dconf.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}


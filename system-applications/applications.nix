{ pkgs, ... }:
{
    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
        wget
        protonup-qt
        tailscale

        gnupg

        btop # System prcocess viewer
        gparted
        
        p7zip
        imagemagick
        file # Get file type from terminal
        brightnessctl # Laptop screen backlight and button controls # TODO: Implement this into Hyprland binds
        seahorse # GNOME keyring manager # TODO: Replace with kwallet keyring

        teams-for-linux
        thunderbird # Email Client

        ntfs3g # To be able to format drives as NTFS

        # TODO: Move these to repositories that actually need them, not actually globally decalre them.
        # gcc
        # libgcc
        # clang
        # cmake
        # gnumake
    ];

    imports = [
        ./1password.nix
        ./steam.nix
        # ./tailscale.nix
        ./virtual-machines.nix
        ./vr.nix
    ];
}
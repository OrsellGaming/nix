#* System Services
{ ... }:
{
    services = {
        # ASUS system services and packages
        supergfxd = {
            enable = true;
            settings = {
                mode = "Hybrid";
                vfio_enable = true;
                vfio_save = true;
            };
        };
        asusd = {
        enable = true;
        enableUserService = true;
        };

        # Needed for store VS Code auth token and 1Password 2FA
        gnome.gnome-keyring.enable = true;

        # Enable the OpenSSH daemon.
        openssh.enable = true;

        pcscd.enable = true;

        # Trackpad Natural Scrolling
        libinput.touchpad.naturalScrolling = true;
        
        # Enable CUPS to print documents.
        printing.enable = true;
    };
}
{pkgs, ...}:
{

    environment.systemPackages = with pkgs; [
        spice-gtk
        virt-manager
    ];

    # Enable Virt-manager
    virtualisation.libvirtd = {
        enable = true;
        qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
    virtualisation.spiceUSBRedirection.enable = true;
    security.wrappers.spice-client-glib-usb-acl-helper.source = "${pkgs.spice-gtk}/bin/spice-client-glib-usb-acl-helper";
    programs.virt-manager.enable = true;
    # virtualisation.virtualbox.host.enable = true;
    # virtualisation.virtualbox.host.enableExtensionPack = true;
    # users.extraGroups.vboxusers.members = [ "n" ];
}
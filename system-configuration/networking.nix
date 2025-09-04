#? Network Configuration for the system, both Wifi and Ethernet.
{ ... }:
{
    networking = {
        hostName = "lambda-core"; # System hostname.

        # Proxy Config
        # proxy.default = "http://user:password@proxy:port/";
        # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
        
        enableIPv6  = false;
        nameservers = [ "1.1.1.1" "8.8.8.8" ];
        
        networkmanager = {
            enable = true;
            wifi = {
                powersave = false; # Disabling powersave can help with faster reconnection
                scanRandMacAddress = false; # Can help with faster reconnection
            };
        };

        # Open ports in the firewall.
        # firewall.allowedTCPPorts = [ ... ];
        # firewall.allowedUDPPorts = [ ... ];
        firewall.enable = false;
    };
}
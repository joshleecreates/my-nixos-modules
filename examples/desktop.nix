{ config, pkgs, ... }:
{
  imports = [
    # Import a VM 'hardware' profile
    ../profiles/vm.nix
    # Import a basic template
    ../templates/desktop.nix
    # Import common settings
    ./common.nix
  ];

  # Set a unique host name
  networking.hostName = "example-desktop";

  # Modify this user as needed
  users.users.admin = {
    isNormalUser = true;
    description = "Linux Admin";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAg/E2UkXORp58O3zxp0dQird+UcvdJkCpKbZj5+ccmh josh@joshuamlee.com"
    ];
  };

  # Enable zsh (if preferred)
  programs.zsh.enable = true;
  users.users.admin.shell = pkgs.zsh;
}


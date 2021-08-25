# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Force use of the thinkpad_acpi driver for backlight control.
  # This allows the backlight save/load systemd service to work.
  boot.kernelModules = [ "acpi_call" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  boot.kernelParams = [ "acpi_backlight=native" ];

  # Set hostname.
  networking.hostName = "sean";

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  # Configure VPN
  services.openvpn.servers = {
    pritunl = {
      autoStart = false;
      updateResolvConf = true;
      config = builtins.readFile ./pritunl.ovpn;
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.xkbOptions = "ctrl:nocaps";

  # Enable and configure the GNOME 3 Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs.gnome3; [
    gnome-music # TODO exclude more gnome packages
    gnome-photos
    gnome-calendar
    gnome-weather
  ];

  services.postgresql = {
    package = pkgs.postgresql_13;
    enable = true;
    enableTCPIP = false;
    authentication = ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
    '';
    extraPlugins = [config.services.postgresql.package.pkgs.postgis];
    # for configuration in NixOS 20.09 or later
    settings = {
      timezone = "UTC";
      shared_buffers = 128;
      fsync = false;
      synchronous_commit = false;
      full_page_writes = false;
    };
  };

  nix = {
    buildCores = 4;
  };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  #
  # Enable zsh.
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
    };
  };

  # Define user accounts. Don't forget to set a password with ‘passwd’.
  users.users.seanmorton = {
    isNormalUser = true;
    home = "/home/seanmorton";
    description = "Sean Morton";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # Allow unfree software :'(
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    curl
    dig
    doge
    evtest
    fd
    firefox
    fzf
    git
    gnome.gnome-tweak-tool
    gthumb
    helmfile
    hledger
    htop
    keybase
    keybase-gui
    insomnia
    lm_sensors
    lsof
    nodejs
    pwgen
    ripgrep
    ruby
    slack
    thefuck
    tmate
    tmux
    unzip
    vim
    wget
    yubikey-manager-qt
    zoom-us
    ghc
    haskellPackages.apply-refact
    haskellPackages.cabal-install
    hlint
    stack
    stylish-haskell
    zlib
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable automatic system upgrades.
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # Enable auto-GC of old generations.
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 30d";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

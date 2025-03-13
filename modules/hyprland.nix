{ config, pkgs, ... }: {
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar # a bar
    wofi # application launcher
    swaynotificationcenter # swaync
    hypridle # idle daemon
    hyprlock # screen locking
  ];
}

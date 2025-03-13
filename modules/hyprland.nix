{ config, pkgs, ...}:
{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    wofi
  ];
}

{
  pkgs,
  inputs,
  lib,
  ...
}: let
  blocklist = builtins.readFile "${inputs.blocklist-hosts}/alternates/porn/hosts";
  filteredBlocklist = builtins.concatStringsSep "\n" (builtins.filter (line: line != "0.0.0.0 fc.yahoo.com") (lib.strings.splitString "\n" blocklist));
in {
  networking = {
    hostName = "X";
    networkmanager.enable = true;
    firewall = {
      enable = true;
    };
    extraHosts = ''
      "${filteredBlocklist}"
    '';
  };
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}

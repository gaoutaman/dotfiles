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
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ]; # Google public DNS servers, Cloudflare
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ]; # 22 - SSH, 80 - HTTP, 443 - HTTPS
    };
    extraHosts = ''
      "${filteredBlocklist}"
    '';
  };
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}

{ config, pkgs, ... }:
let
    dbs = import ./databases/databases.nix pkgs;
in
{


#   config.environment.systemPackages = with pkgs; [
#     gnomeExtensions.caffeine
#     gnomeExtensions.appindicator
#   ];

#   config.services.udev.packages = with pkgs; [
#     gnome.gnome-settings-daemon
#   ];

  config.services.postgresql = dbs.postgresConf;

  config.services.redis.servers."euler-redis" = {

    enable = true;
    port = 6379;
  };

}

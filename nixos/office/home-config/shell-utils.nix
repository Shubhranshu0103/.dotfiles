{ config, pkgs, ... }:
{
    programs.exa = {
        enable          = true;
        enableAliases   = true;
        icons           = true;
        git             = false;
    };

    programs.bat = {
        enable = true;
    };
}
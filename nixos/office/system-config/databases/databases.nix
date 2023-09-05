pkgs :
let
    postgresDatabases = ["frmdb"];
    postgresPkg = pkgs.postgresql_14;
    postgresInitScript = ''
        create user 'shubh';
    '';
    postgresConf = import ./postgresql.nix pkgs true postgresPkg postgresDatabases postgresInitScript;

in 
{
    inherit postgresConf;
}
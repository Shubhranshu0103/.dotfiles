pkgs: enable: package: ensureDatabases: customScript:
let
    authString = ''
        #type database  DBuser  Address auth-method
        local all       all             trust
        host  all       all    127.0.0.1/32 trust
    '';
    # cloudUserCreateScript = "create user cloud with password 'scape';\n";
    initialScript = pkgs.writeText "initScript" customScript;
in {
    inherit enable package initialScript ensureDatabases;
    authentication = pkgs.lib.mkOverride 10 authString;
    ensureUsers = [
        {
            name = "cloud";
        }
    ];
}
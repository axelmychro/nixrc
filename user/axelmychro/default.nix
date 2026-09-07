{
  assets,
  lib,
  user,
  ...
}:
{
  _module.args.user = "axelmychro";
  system.activationScripts.face.text = ''
    USER_ICON_DIR=/var/lib/AccountsService/icons
    rm -f "$USER_ICON_DIR/${user}"
    ln -sfn "${assets}/${user}-face.png" "$USER_ICON_DIR/${user}"
    unset USER_ICON_DIR
  '';
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6PBGNhpPnKvAjl2k0oZeY732xawJPcRM/G4yjc+vgR axelmychro@prts"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3t0YR5cFGKfTOpWZ9MJDf8Av+LstI6A+J+mLbm7lpK axelmychro@prts-web"
    ];
  };

  services.postgresql = {
    authentication = lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
    ensureDatabases = [ user ];
    ensureUsers = [
      {
        ensureClauses = {
          login = true;
        };
        name = user;
      }
    ];
  };
}

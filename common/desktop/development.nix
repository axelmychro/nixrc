{
  lib,
  pkgs,
  config,
  ...
}:
let
  ai_packages = lib.optional config.common.development.ai.enable (
    with pkgs;
    [
      aichat
      upscayl
      video2x
    ]
  );
in
{
  config = lib.mkIf config.common.development.enable {
    services = {
      postgresql = {
        enable = true;
        ensureDatabases = [ "mydatabase" ];
        authentication = pkgs.lib.mkOverride 10 ''
          #type database  DBuser  auth-method
          local all       all     trust
        '';
      };
      ollama = {
        enable = config.common.development.ai.enable;
        package = pkgs.ollama-cuda;
        port = 11434;
      };
      open-webui = {
        enable = config.common.development.ai.enable;
        port = 8081;
      };
    };
    programs.tmux.enable = true;
    environment.systemPackages =
      with pkgs;
      [
        nodejs
        pnpm
        zed-editor
        video2x
      ]
      ++ ai_packages;
  };
  options.common.development = {
    enable = lib.mkEnableOption "Common desktop development options";
    ai.enable = lib.mkEnableOption "AI in development.";
  };
}

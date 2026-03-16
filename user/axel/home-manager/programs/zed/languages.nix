{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    nixfmt-rfc-style

    shfmt
    shellcheck

    fish-lsp
    kdlfmt

    gcc
    clang-tools

    python3
    pyright
    ruff
  ];

  programs.zed-editor = {
    extensions = [
      "nix"
      "fish"
      "kdl"
    ];

    userSettings.languages = {

      "Nix" = {
        language_servers = [ "nixd" ];
        formatter.external.command = "nixfmt";
      };

      "Shell Script" = {
        formatter.external = {
          command = "shfmt";
          arguments = [
            "-s"
            "-i"
            "2"
            "-ci"
            "-sr"
          ];
        };
      };

      "Fish" = {
        language_servers = [ "fish-lsp" ];
        formatter.external = {
          command = "fish_indent";
        };
      };

      "Kdl" = {
        formatter.external = {
          command = "kdlfmt";
          arguments = [
            "format"
            "-"
          ];
        };
      };

      "C" = {
        language_servers = [ "clangd" ];
        formatter.external.command = "clang-format";
      };

      "C++" = {
        language_servers = [ "clangd" ];
        formatter.external.command = "clang-format";
      };

      "Python" = {
        language_servers = [
          "pyright"
          "ruff"
        ];
        formatter.language_server.name = "ruff";
      };
    };
  };
}

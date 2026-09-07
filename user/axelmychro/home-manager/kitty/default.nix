{ theme, ... }:
let
  kitty_conf = if theme == "rose-pine" then ./kitty-rose_pine.conf else ./kitty-rose_pine_dawn.conf;
in
{
  programs.kitty.enable = true;
  xdg.configFile."kitty/kitty.conf".text = ''
    hide_window_decorations titlebar-only
    font_family             GoMono Nerd Font
    font_size               12.0
    background_opacity      0.9

    ${builtins.readFile kitty_conf}
  '';
}

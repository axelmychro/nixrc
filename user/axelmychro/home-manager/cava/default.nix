{ theme, ... }: {
  programs.cava.enable = true;
  xdg.configFile."cava/config".text =
    if theme == "rose-pine" then
      ''
        [color]
        background = '#191724'
        gradient = 1
        gradient_count = 6
        gradient_color_1 = '#31748f'
        gradient_color_2 = '#9ccfd8'
        gradient_color_3 = '#c4a7e7'
        gradient_color_4 = '#eb6f92'
        gradient_color_5 = '#ea9a97'
        gradient_color_6 = '#f6c177'

      ''
    else
      ''
        [color]
        background = '#faf4ed'
        gradient = 1
        gradient_count = 6
        gradient_color_1 = '#286983'
        gradient_color_2 = '#56949f'
        gradient_color_3 = '#907aa9'
        gradient_color_4 = '#b4637a'
        gradient_color_6 = '#ea9d34'
        gradient_color_5 = '#d7827e'
      '';
}

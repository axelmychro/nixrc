{
  assets,
  inputs,
  ...
}:
let
  sddm_bg_file_name = "amiya.mp4";
  font_family_name = "GoMono Nerd Font";
in
{
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  programs.silentSDDM = {
    theme = "silvia";
    backgrounds.${sddm_bg_file_name} = "${assets}/${sddm_bg_file_name}";
    settings = {
      "LockScreen".background = sddm_bg_file_name;
      "LoginScreen".background = sddm_bg_file_name;
      "LockScreen.Clock".color = "#FFFFFF";
      "LockScreen.Date".color = "#FFFFFF";
      "LoginScreen.Clock".font-family = font_family_name;
      "LoginScreen.Date".font-family = font_family_name;
      "LoginScreen.Message".font-family = font_family_name;
      "LoginScreen.LoginArea.Avatar".shape = "square";
      "LoginScreen.LoginArea.Username" = {
        font-family = font_family_name;
        color = "#FFFFFF";
      };
      "LoginScreen.LoginArea.PasswordInput".font-family = font_family_name;
      "LoginScreen.LoginArea.LoginButton".font-family = font_family_name;
      "LoginScreen.LoginArea.Spinner".font-family = font_family_name;
      "LoginScreen.LoginArea.WarningMessage" = {
        font-family = font_family_name;
        font-weight = 700;
        normal-color = "#FFFFFF";
        warning-color = "#FFFFFF";
        error-color = "#FFFFFF";
      };
      "LoginScreen.LoginArea.Buttons".font-family = font_family_name;
      "LoginScreen.LoginArea.Popups".font-family = font_family_name;
      "Tooltips".font-family = font_family_name;
    };
    enable = true;
  };
}

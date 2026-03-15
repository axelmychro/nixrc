_: {
  programs.zen-browser.policies = {
    AutofillAddressEnabled = true;
    AutofillCreditCardEnabled = false;
    DisableAppUpdate = true;
    DisablePocket = true;
    DisableTelemetry = true;
    DontCheckDefaultBrowser = true;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
    };
  };
}

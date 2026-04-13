_: {
  programs.fish.functions = {
    kya = builtins.readFile ./kya.fish;
  };
}

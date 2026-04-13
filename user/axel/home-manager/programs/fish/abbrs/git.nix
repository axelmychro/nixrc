_: {
  programs.fish.shellAbbrs = {
    g = "git";
    gg = "git status";
    ggg = "git status; and git fetch; and git stash list";

    ga = "git add";
    gaa = "git add .";

    gb = "git branch";
    gbd = "git branch -d";

    gco = "git checkout";
    gcob = "git checkout -b";

    gcn = "git clean";
    gcnn = "git clean -fd";

    gct = "git commit";
    gcf = "git commit --fixup";
    gctt = "git commit --amend --no-edit";

    gd = "git diff";
    gds = "git diff --staged";

    gf = "git fetch";

    gl = "git log";
    gll = "git log --oneline --graph --decorate --all";

    gpl = "git pull";
    gplr = "git pull --rebase";

    gph = "git push";
    gphf = "git push --force";
    gphl = "git push --force-with-lease";

    grb = "git rebase";
    grbi = "git rebase -i";

    grs = "git reset";
    grsh = "git reset --hard";

    gre = "git remote -v";

    gs = "git stash";
    gsl = "git stash list";
    gsu = "git stash -u";
    gsm = "git stash push -m";
    gsum = "git stash push -um";
    gsa = "git stash apply";
    gsd = "git stash drop";
    gsp = "git stash pop";
  };
}

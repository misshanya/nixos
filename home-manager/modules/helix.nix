{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "rose_pine";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "go";
        auto-format = true;
      }
      {
        name = "rust";
        auto-format = true;
      }
    ];
    languages.language-server.rust-analyzer = {
      config = {
        check.command = "clippy";
        diagnostics.styleLints.enable = true;
      };
    };
    extraPackages = with pkgs; [
      gopls
    ];
  };
}


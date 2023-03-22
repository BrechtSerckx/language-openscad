let
  project = import ./default.nix;
  pkgs = import ./nix/pkgs.nix;
  sources = import ./nix/sources.nix { };
in project.shellFor {

  withHoogle = true;

  tools = {
    cabal = "2.4.1.0";
    hlint = "2.1.26";
    ghcid = "0.8.7";
    ormolu = "0.1.4.1";
    haskell-language-server = "1.8.0.0";
  };

  buildInputs = with pkgs; [
    nixfmt
    (import sources.nixpkgs-act { }).act
    cmake
    bash
    haskell-ci
  ];

  exactDeps = true;
}

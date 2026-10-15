{
  description = "A terminal chat CLI, written in haskell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages =
            (with pkgs; [
              git
              jujutsu
            ])
            ++ (with pkgs.haskellPackages; [
              ghc
              haskell-language-server
              cabal-install
              cabal-gild
              ghcid
              hlint
            ]);
        };
      });
    };
}

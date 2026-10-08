{
  description = "A terminal chat CLI, written in haskell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          jujutsu
          ghc
          haskell-language-server
          cabal-install
          ghcid
          hlint
        ];
      };
    };
}

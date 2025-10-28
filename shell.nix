{ pkgs ? import <nixpkgs> {} }:

let
  rWithPackages = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      rmarkdown
      knitr
      ggplot2
      dplyr
      tidyr
      readr
      stringr
    ];
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    quarto
    rWithPackages
    pandoc
    texlive.combined.scheme-full
  ];

  shellHook = ''
    echo "Quarto + R environment ready"
  '';
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/22.05";
    flake-utils.url = "github:numtide/flake-utils";
    v2.url = "github:gazebosim/gz-cmake/ignition-cmake2_2.15.0";
    v2.flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, v2 }:
    flake-utils.lib.eachDefaultSystem (system: 
      with nixpkgs.legacyPackages.${system}; {
        packages.v2 = stdenv.mkDerivation rec {
          pname = "ignition-cmake2";
          version = "2.15.0";
          
          src = v2;

          nativeBuildInputs = [ cmake ];
          # pkg-config is needed to use some CMake modules in this package
          propagatedBuildInputs = [ pkg-config ];

          meta = with lib; {
            homepage = "https://ignitionrobotics.org/libs/cmake";
            description = "CMake Modules for Ignition Projects";
            license = licenses.asl20;
            platforms = platforms.all;
          };
        };
      }
    );
}
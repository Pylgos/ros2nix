{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcgcrd_spl_4,
  substituteSource,
}:
let
  sources = rec {
    rcgcrd_spl_4_conversion = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "bbca7205ace92413df795704878299f52bca1d72";
        hash = "sha256-7SPbb0H6Q3oLuhTv21Kn76MWjQ1Bq+HJ5RdQ1pdABls=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcrd_spl_4_conversion";
  version = "3.1.0-1";
  src = sources.rcgcrd_spl_4_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct rcgcrd_spl_4 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

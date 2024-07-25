{
  ament_cmake,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    neo_simulation2 = substituteSource {
      src = fetchgit {
        name = "neo_simulation2-source";
        url = "https://github.com/ros2-gbp/neo_simulation2-release.git";
        rev = "4bba460e393da08938ad1f2a9a195cb8597fbf51";
        hash = "sha256-RDPwVwW9QTfOVM8jYVgKbR+YmGDSXRq1Wz5minbCbD8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "neo_simulation2";
  version = "1.0.0-4";
  src = sources.neo_simulation2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

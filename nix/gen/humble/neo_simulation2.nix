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
        rev = "4e5a0709f962636ef5ecca684d8a2f38b4f8a71e";
        hash = "sha256-AEgFzFZfgKi6yp6aeHAETABt5PXW2Ugz993IleDbO9k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "neo_simulation2";
  version = "1.0.0-3";
  src = sources.neo_simulation2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

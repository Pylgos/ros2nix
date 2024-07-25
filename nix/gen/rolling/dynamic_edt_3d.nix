{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap,
  substituteSource,
}:
let
  sources = rec {
    dynamic_edt_3d = substituteSource {
      src = fetchgit {
        name = "dynamic_edt_3d-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "29869e9ee66fa65b88eca0e6d7880e05e372ff72";
        hash = "sha256-w1VOjU0mpO24Z2FAcdzCrmrRF6p7q2M/GbXhGlh3K0w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamic_edt_3d";
  version = "1.10.0-3";
  src = sources.dynamic_edt_3d;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

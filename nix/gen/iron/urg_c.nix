{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    urg_c = substituteSource {
      src = fetchgit {
        name = "urg_c-source";
        url = "https://github.com/ros2-gbp/urg_c-release.git";
        rev = "97990754b9de102b4a3ebf6b5487255928ffb673";
        hash = "sha256-d1sMppxyaGt43L2i5Eplkfen4tHz1t6hkC42mCbg0EM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urg_c";
  version = "1.0.4001-5";
  src = sources.urg_c;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

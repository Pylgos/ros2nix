{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  openssl,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    naoqi_libqi = substituteSource {
      src = fetchgit {
        name = "naoqi_libqi-source";
        url = "https://github.com/ros-naoqi/libqi-release.git";
        rev = "cc106e84c08065a978d163033d67d7f530c17cba";
        hash = "sha256-AG0mf99fX20ie4x2S5JFrLncF7PtLXVNplRcDjOXMUI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "naoqi_libqi";
  version = "3.0.2-1";
  src = sources.naoqi_libqi;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

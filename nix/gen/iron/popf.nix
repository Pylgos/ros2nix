{
  ament_cmake,
  bison,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flex,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    popf = substituteSource {
      src = fetchgit {
        name = "popf-source";
        url = "https://github.com/ros2-gbp/popf-release.git";
        rev = "67a4523545f43b52fe8d19c285e18c36d7cd99cc";
        hash = "sha256-quM8/p5P4wj88MrkZ+pyTyxMZ929EyjoS2o0yWKyots=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "popf";
  version = "0.0.15-1";
  src = sources.popf;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bison flex rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  bullet,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    tf2_bullet = substituteSource {
      src = fetchgit {
        name = "tf2_bullet-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "5b8fff4afc10fe7424e873e2102f2b4673e614e3";
        hash = "sha256-s55k7KYqSYA1R7AvCS+uhtVYZtwuGfHv3uVcq2hrdhQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_bullet";
  version = "0.25.7-1";
  src = sources.tf2_bullet;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bullet geometry_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

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
        rev = "9802669962f7b09b73fd153ec9ec8bca7e1762c9";
        hash = "sha256-obNqt7epfq57889/GfjFRVuCf15CJ51CbrM/p+NsAiQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_bullet";
  version = "0.38.0-1";
  src = sources.tf2_bullet;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bullet geometry_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

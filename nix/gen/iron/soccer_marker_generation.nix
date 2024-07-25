{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  soccer_object_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    soccer_marker_generation = substituteSource {
      src = fetchgit {
        name = "soccer_marker_generation-source";
        url = "https://github.com/ros2-gbp/soccer_visualization-release.git";
        rev = "2a2e88722a50be916f45916a519352a115ed6c64";
        hash = "sha256-j3rFXdz5u/W7Cp66bF6y4unx0IjnBPnIlO6J3N1M9yI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_marker_generation";
  version = "0.1.0-3";
  src = sources.soccer_marker_generation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp soccer_object_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

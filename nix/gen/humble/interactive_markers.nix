{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclpy,
  rmw,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    interactive_markers = substituteSource {
      src = fetchgit {
        name = "interactive_markers-source";
        url = "https://github.com/ros2-gbp/interactive_markers-release.git";
        rev = "dace99fbd8e164b82258ba4bc7f8bc213c9140b4";
        hash = "sha256-AOue7aI9DAZ4GHtHtOAPRcV7DJ0zvONib2v2n+DIggY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "interactive_markers";
  version = "2.3.2-2";
  src = sources.interactive_markers;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp rclpy tf2 tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

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
  rcutils,
  rmw,
  std_msgs,
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
        rev = "74a9af4f60f4ee34d1f8b29e33392646556b08df";
        hash = "sha256-XV+QxzrIP/uOtIposUhZR7PLoMGd/9uD0llWnSMsyIY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "interactive_markers";
  version = "2.6.0-1";
  src = sources.interactive_markers;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp rclpy rcutils rmw std_msgs tf2 tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

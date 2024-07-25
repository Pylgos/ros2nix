{
  ament_cmake,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  qt5,
  rcl_interfaces,
  rclcpp,
  rclcpp_action,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  std_srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlesim = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "205fe467b03de9a26e48412be9dbaca891e61e58";
        hash = "sha256-ScRkcoKTh8w/01Pr4e1XG4et8HaHvqxYdnNUSuzKyTE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlesim";
  version = "1.9.1-1";
  src = sources.turtlesim;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp geometry_msgs qt5.qtbase rcl_interfaces rclcpp rclcpp_action rosidl_default_runtime std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

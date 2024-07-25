{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  qt5,
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
        rev = "0e3f0af8deac5a3837eecb37d750b0d5cae321c9";
        hash = "sha256-aasLRqKCjuLL2lV4bWgYs/teS/UyiGhEVpy5P+fKXt4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlesim";
  version = "1.4.2-1";
  src = sources.turtlesim;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs qt5.qtbase rclcpp rclcpp_action rosidl_default_runtime std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

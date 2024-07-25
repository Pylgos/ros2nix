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
        rev = "6b9bdc17fa02ed85d99517c7a37d4fb216f30b7c";
        hash = "sha256-kpXuHLfZ2/Dv8XFR/BhuuR+nmYFwDwJUm1akCKzaVY0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlesim";
  version = "1.6.1-1";
  src = sources.turtlesim;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs qt5.qtbase rclcpp rclcpp_action rosidl_default_runtime std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

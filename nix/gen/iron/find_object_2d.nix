{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  message_filters,
  qt5,
  rclcpp,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    find_object_2d = substituteSource {
      src = fetchgit {
        name = "find_object_2d-source";
        url = "https://github.com/ros2-gbp/find_object_2d-release.git";
        rev = "ec91183d2e4b674591e8fa6eaa14f3e1ce9a5f3b";
        hash = "sha256-KtLe1v52K9gb/p4t0Yqdkc99Hgi67wNcFpmguOilOnA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "find_object_2d";
  version = "0.7.0-5";
  src = sources.find_object_2d;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces cv_bridge geometry_msgs image_transport message_filters qt5.qtbase rclcpp rosidl_default_runtime sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

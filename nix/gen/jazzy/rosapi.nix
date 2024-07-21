{
  ament_cmake_pytest,
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcl_interfaces,
  rclpy,
  rmw_dds_common,
  ros2node,
  ros2param,
  ros2pkg,
  ros2service,
  ros2topic,
  rosapi_msgs,
  rosbridge_library,
  sensor_msgs,
  shape_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosapi = substituteSource {
      src = fetchgit {
        name = "rosapi-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "72cbe2e3a2f5a98e160d86e54667eceda6d47114";
        hash = "sha256-5gDyqSXHMOUheu+7fjleKwHApIpOlhVvL9dpEujRBA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosapi";
  version = "1.3.2-3";
  src = sources.rosapi;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl_interfaces rclpy ros2node ros2param ros2pkg ros2service ros2topic rosapi_msgs rosbridge_library ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

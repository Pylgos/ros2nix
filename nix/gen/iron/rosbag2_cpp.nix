{
  ament_cmake,
  ament_cmake_gmock,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rmw_implementation,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_test_msgdefs,
  rosidl_runtime_c,
  rosidl_runtime_cpp,
  rosidl_typesupport_cpp,
  rosidl_typesupport_introspection_cpp,
  shared_queues_vendor,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosbag2_cpp = substituteSource {
      src = fetchgit {
        name = "rosbag2_cpp-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "40bf8ce1e0ccc09fc4ef59df8837ef79c5814292";
        hash = "sha256-HEMzZp+Ouz/t5qi0JJmHeiYDl9rMJQSVJrm+Jw5abLg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_cpp";
  version = "0.22.6-1";
  src = sources.rosbag2_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rclcpp rcpputils rcutils rmw_implementation rosbag2_storage rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_cpp rosidl_typesupport_introspection_cpp shared_queues_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

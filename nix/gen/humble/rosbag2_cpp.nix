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
        rev = "b3aded179db81d398642e40b1c38bbb1cfc2da57";
        hash = "sha256-cdvsAMET0Sbf2BO6yEmjEXsPBOk/VXcYry2NvylowM0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_cpp";
  version = "0.15.11-1";
  src = sources.rosbag2_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib rclcpp rcpputils rcutils rmw_implementation rosbag2_storage rosbag2_storage_default_plugins rosidl_runtime_c rosidl_runtime_cpp rosidl_typesupport_cpp rosidl_typesupport_introspection_cpp shared_queues_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

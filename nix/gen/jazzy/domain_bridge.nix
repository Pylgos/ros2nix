{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  libyamlcpp,
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw_connextdds,
  rmw_cyclonedds_cpp,
  rmw_fastrtps_cpp,
  rmw_implementation_cmake,
  rosbag2_cpp,
  rosgraph_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  rosidl_typesupport_cpp,
  substituteSource,
  test_msgs,
  zstd_vendor,
}:
let
  sources = rec {
    domain_bridge = substituteSource {
      src = fetchgit {
        name = "domain_bridge-source";
        url = "https://github.com/ros2-gbp/domain_bridge-release.git";
        rev = "23216d613ab4e031c139bbcf42e6306f907b0d13";
        hash = "sha256-eajUFSE7L+45VSlUvbXcvd6RjjdERKimvpFjuXVbCO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "domain_bridge";
  version = "0.5.0-5";
  src = sources.domain_bridge;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyamlcpp rclcpp rclcpp_components rcutils rosbag2_cpp rosidl_default_runtime rosidl_typesupport_cpp zstd_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

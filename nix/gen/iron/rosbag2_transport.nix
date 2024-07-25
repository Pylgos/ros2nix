{
  ament_cmake_gmock,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  keyboard_handler,
  rclcpp,
  rmw,
  rmw_implementation_cmake,
  rosbag2_compression,
  rosbag2_compression_zstd,
  rosbag2_cpp,
  rosbag2_interfaces,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  shared_queues_vendor,
  substituteSource,
  test_msgs,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_transport = substituteSource {
      src = fetchgit {
        name = "rosbag2_transport-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "8a2a192307495fc4c97d8d47f624b3d42c0ffdc2";
        hash = "sha256-MVEdIFhhjw1abQLlDekDZtDZYf4eykXawqa+el3vXHs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_transport";
  version = "0.22.6-1";
  src = sources.rosbag2_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ keyboard_handler rclcpp rosbag2_compression rosbag2_cpp rosbag2_interfaces rosbag2_storage shared_queues_vendor yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

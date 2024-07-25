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
        rev = "4425f2861e32e9212ff381f25dc6c2335b690fec";
        hash = "sha256-bxWibhBtJuT3CxxxLST+shOTr+CsNgg1c4RoylYJx3Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_transport";
  version = "0.15.11-1";
  src = sources.rosbag2_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ keyboard_handler rclcpp rosbag2_compression rosbag2_cpp rosbag2_interfaces rosbag2_storage shared_queues_vendor yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake_python,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  python3Packages,
  python_cmake_module,
  rcl_interfaces,
  rclpy,
  rosbag2_compression,
  rosbag2_cpp,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  rosbag2_transport,
  rosidl_runtime_py,
  rpyutils,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_py = substituteSource {
      src = fetchgit {
        name = "rosbag2_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "730e266281f39005c0c3f5a9356bd3a3c3023a6e";
        hash = "sha256-2uiTk/Zvs7Ht0XA2XYaN23Qk6KHrHIerriP0GS4v1SU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_py";
  version = "0.22.6-1";
  src = sources.rosbag2_py;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_vendor rosbag2_compression rosbag2_cpp rosbag2_storage rosbag2_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

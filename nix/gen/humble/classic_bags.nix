{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclpy,
  rosbag2_cpp,
  rosbag2_py,
  rosbag2_storage,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    classic_bags = substituteSource {
      src = fetchgit {
        name = "classic_bags-source";
        url = "https://github.com/ros2-gbp/classic_bags-release.git";
        rev = "bcc6e3f76d70f31b5b077d85102b952dc12f0919";
        hash = "sha256-qorfH5BwfKfqCtH4qpiFV99uRnkpbgifA4GgAuobCO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "classic_bags";
  version = "0.1.0-1";
  src = sources.classic_bags;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclcpp rclpy rosbag2_cpp rosbag2_py rosbag2_storage rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

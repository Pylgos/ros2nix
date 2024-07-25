{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  event_camera_codecs,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  python3Packages,
  python_cmake_module,
  rclpy,
  ros_environment,
  rosbag2_py,
  rosbag2_storage_default_plugins,
  rosidl_runtime_py,
  rpyutils,
  substituteSource,
}:
let
  sources = rec {
    event_camera_py = substituteSource {
      src = fetchgit {
        name = "event_camera_py-source";
        url = "https://github.com/ros2-gbp/event_camera_py-release.git";
        rev = "8aa63cc5c82279a2acd2f02c6759cef1e63ea273";
        hash = "sha256-GewrZ5XMUiihslFd2SEt8C2WAYVEvAHoNJ9QeGfRSDo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "event_camera_py";
  version = "1.1.6-1";
  src = sources.event_camera_py;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_python ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ ros_environment rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ event_camera_codecs event_camera_msgs pybind11_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  rclcpp,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_test_common = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_common-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "6ca2c0c15425e61c3bb84751edf8bcf86f9cbc23";
        hash = "sha256-GYbIbwrEpfPmbeClGNU51onm89dZrtl7D7uzTCqqkyU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_test_common";
  version = "0.22.6-1";
  src = sources.rosbag2_test_common;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

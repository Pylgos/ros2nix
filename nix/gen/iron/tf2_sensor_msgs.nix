{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_cmake_module,
  rclcpp,
  sensor_msgs,
  sensor_msgs_py,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "tf2_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "237649fae27d611aa48ea6fc9d0e7dd19ef07474";
        hash = "sha256-GcCOdW1Nqws8WzHW8OsKayr+NrPWzEOBky2kRTvImxE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_sensor_msgs";
  version = "0.31.7-1";
  src = sources.tf2_sensor_msgs;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs sensor_msgs sensor_msgs_py std_msgs tf2 tf2_ros tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

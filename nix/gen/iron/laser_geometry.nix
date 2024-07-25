{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_uncrustify,
  buildPackages,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  rclcpp,
  rclpy,
  sensor_msgs,
  sensor_msgs_py,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    laser_geometry = substituteSource {
      src = fetchgit {
        name = "laser_geometry-source";
        url = "https://github.com/ros2-gbp/laser_geometry-release.git";
        rev = "a0cee3bf822d2f7c99d3cf34e265de025aa98c06";
        hash = "sha256-FN/clkUZPUF0jNwKWoGRzAuiDHeUiPffwGRhI+VPW1U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "laser_geometry";
  version = "2.5.0-3";
  src = sources.laser_geometry;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rclcpp rclpy sensor_msgs sensor_msgs_py tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
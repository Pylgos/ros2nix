{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_core,
  as2_msgs,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclpy,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    as2_platform_tello = substituteSource {
      src = fetchgit {
        name = "as2_platform_tello-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "84292f2e9c28c54cf24bb965b10d80bd7b659496";
        hash = "sha256-QJa3JWugjshjf/nEqOe3642YOHZWH+dcQPv6Z8CXU4c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_platform_tello";
  version = "1.0.9-1";
  src = sources.as2_platform_tello;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs eigen geometry_msgs nav_msgs rclcpp rclpy sensor_msgs std_msgs std_srvs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

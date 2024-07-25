{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mola_common,
  mola_kernel,
  mrpt2,
  nav_msgs,
  rclcpp,
  ros_environment,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mola_bridge_ros2 = substituteSource {
      src = fetchgit {
        name = "mola_bridge_ros2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "187293b56a3552a58cb29acce8b5f859a0b5a680";
        hash = "sha256-jxbG3BnHn8KqByvBE0R5WNjxZeyoAuH1H1QBONySt7Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_bridge_ros2";
  version = "1.0.6-1";
  src = sources.mola_bridge_ros2;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint ament_lint_common geometry_msgs mola_common mola_kernel mrpt2 nav_msgs rclcpp sensor_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

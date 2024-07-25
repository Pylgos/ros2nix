{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  opencv,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    depthimage_to_laserscan = substituteSource {
      src = fetchgit {
        name = "depthimage_to_laserscan-source";
        url = "https://github.com/ros2-gbp/depthimage_to_laserscan-release.git";
        rev = "1fa0d73abb3beb7a5e40c0143c479427a1528f5d";
        hash = "sha256-QU8tJNEPEB6X439eDP+kDXczR29OQNtKRX1uXKDqgDo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthimage_to_laserscan";
  version = "2.5.1-1";
  src = sources.depthimage_to_laserscan;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_geometry opencv rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

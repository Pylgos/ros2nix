{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    tuw_geometry = substituteSource {
      src = fetchgit {
        name = "tuw_geometry-source";
        url = "https://github.com/ros2-gbp/tuw_geometry-release.git";
        rev = "ee6e809cd9fbd8579194b2ac10229a59a68dbbb0";
        hash = "sha256-9EzwFOUEWj6v0m5tNX4dIuoRnugu1ULGN9y2oAHgx8E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_geometry";
  version = "0.1.1-1";
  src = sources.tuw_geometry;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

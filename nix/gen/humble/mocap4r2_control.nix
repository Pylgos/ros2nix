{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mocap4r2_control_msgs,
  rclcpp,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mocap4r2_control = substituteSource {
      src = fetchgit {
        name = "mocap4r2_control-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "5705205c336a3155e98561916d3080ae73b6ee22";
        hash = "sha256-dItHIh3IGoVKn/xcPQppnUZHBrq2F8k1i3si9+0o8ys=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_control";
  version = "0.0.7-1";
  src = sources.mocap4r2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mocap4r2_control_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

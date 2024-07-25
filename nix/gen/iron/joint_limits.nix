{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing_ament_cmake,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    joint_limits = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "cd53fc466961524a691b0c4d41087d76f350e1db";
        hash = "sha256-KePiwkTk42fqlsmNlhPtJvKnvS5TkzYu0vBPo5akNik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_limits";
  version = "3.25.0-1";
  src = sources.joint_limits;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_lifecycle urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

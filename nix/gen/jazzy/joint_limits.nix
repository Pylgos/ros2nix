{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
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
        rev = "7f970d6188b386adb8ef775fe426c58ffc7811b1";
        hash = "sha256-DMtGAwJJ1G9QD5vo+XD0AdkW4IVp0Ww1FaGBaD2Tp7Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_limits";
  version = "4.11.0-1";
  src = sources.joint_limits;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_lifecycle urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

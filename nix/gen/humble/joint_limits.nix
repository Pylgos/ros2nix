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
}:
let
  sources = rec {
    joint_limits = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "64928df04213ff1bce193cacddddffae175e5c03";
        hash = "sha256-TupG0y78FuVOq1gbGWBck8rxOFzzBTHpU+nschRM4vc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_limits";
  version = "2.41.0-1";
  src = sources.joint_limits;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

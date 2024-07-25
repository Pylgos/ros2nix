{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    plansys2_lifecycle_manager = substituteSource {
      src = fetchgit {
        name = "plansys2_lifecycle_manager-source";
        url = "https://github.com/IntelligentRoboticsLabs/ros2_planning_system-release.git";
        rev = "88aae5f03468c270e86ad374ba757ec6d1e7de19";
        hash = "sha256-iFKlj4o36CrEDrkvpL1zGUSMIQMu53oC3ea34NGHeX4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_lifecycle_manager";
  version = "2.0.9-1";
  src = sources.plansys2_lifecycle_manager;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

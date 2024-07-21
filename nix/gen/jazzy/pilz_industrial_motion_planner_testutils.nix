{
  ament_cmake,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_core,
  moveit_msgs,
  rclcpp,
  substituteSource,
  tf2_eigen,
}:
let
  sources = rec {
    pilz_industrial_motion_planner_testutils = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner_testutils-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e37a5de225970f5c0d697690238624890d61eade";
        hash = "sha256-7WiArC/gMWnzY2VBbU2qqYwXwxvBo7+1yo9oyX/SB0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pilz_industrial_motion_planner_testutils";
  version = "2.10.0-1";
  src = sources.pilz_industrial_motion_planner_testutils;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [ tf2_eigen ];
  propagatedBuildInputs = [ moveit_common moveit_core moveit_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
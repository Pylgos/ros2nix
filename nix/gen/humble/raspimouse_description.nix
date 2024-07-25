{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ign_ros2_control,
  joint_state_publisher,
  joint_state_publisher_gui,
  launch,
  realsense2_description,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    raspimouse_description = substituteSource {
      src = fetchgit {
        name = "raspimouse_description-source";
        url = "https://github.com/ros2-gbp/raspimouse_description-release.git";
        rev = "e1115c86ed0766df4d488d58ff2ee7b14879d807";
        hash = "sha256-jeuxiJ92y6oLmmPYRGOpXHagjJW6LoIb2BjVqYQLwdQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_description";
  version = "1.2.0-1";
  src = sources.raspimouse_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ign_ros2_control joint_state_publisher joint_state_publisher_gui realsense2_description robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

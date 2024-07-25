{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  raspimouse_description,
  raspimouse_fake,
  robot_state_publisher,
  ros_gz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    raspimouse_gazebo = substituteSource {
      src = fetchgit {
        name = "raspimouse_gazebo-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "f196d60e9b3f669bc3545ad9a7d3c7d8a93a0ebb";
        hash = "sha256-iock0uWiUt2Idr4bcnw1MMweVen8ti4o406a8SnhBoQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_gazebo";
  version = "2.1.0-1";
  src = sources.raspimouse_gazebo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager diff_drive_controller joint_state_broadcaster raspimouse_description raspimouse_fake robot_state_publisher ros_gz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

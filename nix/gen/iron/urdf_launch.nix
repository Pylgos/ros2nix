{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  launch_ros,
  robot_state_publisher,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    urdf_launch = substituteSource {
      src = fetchgit {
        name = "urdf_launch-source";
        url = "https://github.com/ros2-gbp/urdf_launch-release.git";
        rev = "98a29f66429ac6e50f73d279488c205931f39db4";
        hash = "sha256-culhEaUIVzEURBnbx83ibUd3MceQsW3fVCfO2lKvIEQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_launch";
  version = "0.1.1-1";
  src = sources.urdf_launch;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui launch_ros robot_state_publisher rviz2 rviz_common rviz_default_plugins xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
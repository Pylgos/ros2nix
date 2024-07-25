{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_plugins,
  gazebo_ros,
  gazebo_ros2_control,
  launch,
  launch_pal,
  launch_ros,
  launch_testing_ament_cmake,
  omni_base_description,
  pal_gazebo_plugins,
  pal_gazebo_worlds,
  play_motion2_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tiago_2dnav,
  tiago_bringup,
  tiago_description,
  tiago_moveit_config,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tiago_gazebo = substituteSource {
      src = fetchgit {
        name = "tiago_gazebo-source";
        url = "https://github.com/pal-gbp/tiago_simulation-release.git";
        rev = "504fad98d540bc290bd934198c8c11767c64cae9";
        hash = "sha256-EtPhZJp2yJ7Z69UtVHKNX8HO8zGrs89dB6SBTNZtLNg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_gazebo";
  version = "4.1.7-1";
  src = sources.tiago_gazebo;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_plugins gazebo_ros gazebo_ros2_control launch_pal launch_ros omni_base_description pal_gazebo_plugins pal_gazebo_worlds play_motion2_msgs tiago_2dnav tiago_bringup tiago_description tiago_moveit_config ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

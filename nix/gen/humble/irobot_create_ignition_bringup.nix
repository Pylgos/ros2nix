{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ign_ros2_control,
  irobot_create_common_bringup,
  irobot_create_description,
  irobot_create_ignition_plugins,
  irobot_create_ignition_toolbox,
  irobot_create_msgs,
  ros_ign_bridge,
  ros_ign_gazebo,
  ros_ign_interfaces,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    irobot_create_ignition_bringup = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "a788c6fecf32e7cb05a0b4eee5964f186f337f55";
        hash = "sha256-fiO45HzfvcyUlGMqjjkuJ3Z+tplErsRIZk+ldIiJCww=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_ignition_bringup";
  version = "2.1.0-1";
  src = sources.irobot_create_ignition_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs ign_ros2_control irobot_create_common_bringup irobot_create_description irobot_create_ignition_plugins irobot_create_ignition_toolbox irobot_create_msgs ros_ign_bridge ros_ign_gazebo ros_ign_interfaces std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

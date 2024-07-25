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
  irobot_create_control,
  irobot_create_description,
  irobot_create_nodes,
  joint_state_publisher,
  robot_state_publisher,
  ros2launch,
  rviz2,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    irobot_create_common_bringup = substituteSource {
      src = fetchgit {
        name = "irobot_create_common_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "b43101e013f16a56b715673f52c21eac8ad12862";
        hash = "sha256-1TpcvnBQlA7xYLtYsHUuLacCHQ20fpZoUHEyLBv4QDg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_common_bringup";
  version = "2.1.0-1";
  src = sources.irobot_create_common_bringup;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_control irobot_create_description irobot_create_nodes joint_state_publisher robot_state_publisher ros2launch rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

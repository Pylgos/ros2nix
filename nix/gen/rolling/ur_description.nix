{
  ament_cmake,
  ament_cmake_pytest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  launch_testing_ros,
  robot_state_publisher,
  rviz2,
  substituteSource,
  urdf,
  urdfdom,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_description = substituteSource {
      src = fetchgit {
        name = "ur_description-source";
        url = "https://github.com/ros2-gbp/ur_description-release.git";
        rev = "9210cc7a66c699a5749e1cbea0c22c8d70933ba8";
        hash = "sha256-q6/k/yCs1TVkOJ5KzGSVPpgylr/fZ53iTLhA2Zrr5TQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_description";
  version = "2.4.1-1";
  src = sources.ur_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

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
        rev = "e728a2d1a75ba04c2e4429072e92c064bf600d78";
        hash = "sha256-anoS/W61z95S6FyX82jRr0dhu7XFx2WkkMiIk4aU3Mo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_description";
  version = "2.3.0-1";
  src = sources.ur_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

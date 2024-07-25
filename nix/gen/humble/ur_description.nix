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
        rev = "f096c526fde8fcf106191e92db37eb58b7e81a0c";
        hash = "sha256-JcYah3s0ZokGIwLcRogDy5uPbz8XuSwjnQjfRiVOL6U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_description";
  version = "2.1.5-1";
  src = sources.ur_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui launch_ros robot_state_publisher rviz2 urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

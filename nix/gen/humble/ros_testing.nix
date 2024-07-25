{
  ament_cmake,
  ament_cmake_core,
  ament_cmake_export_dependencies,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  ros2test,
  substituteSource,
}:
let
  sources = rec {
    ros_testing = substituteSource {
      src = fetchgit {
        name = "ros_testing-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "d967927d4fd56ff3d6b07a5691d67b14699f8e32";
        hash = "sha256-sUwtH8qmHyoxmIc0wz8dHJFON0w90U1JFymI3aV6c1U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_testing";
  version = "0.4.0-3";
  src = sources.ros_testing;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies launch_testing launch_testing_ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_testing_ros ros2test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

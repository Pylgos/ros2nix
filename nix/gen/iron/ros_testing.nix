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
        rev = "53e777940c9af8b34429a9f60e38850d37debfde";
        hash = "sha256-gLdIbOqSQ73mATdKNZvG5pOxSYs0W5Md4ykeqj27X8c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_testing";
  version = "0.5.2-3";
  src = sources.ros_testing;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies launch_testing launch_testing_ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_testing_ros ros2test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

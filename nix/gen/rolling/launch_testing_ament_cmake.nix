{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  python_cmake_module,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_ament_cmake = substituteSource {
      src = fetchgit {
        name = "launch_testing_ament_cmake-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "74e9624513d3fa2648eb78c1c374c2c43fcdac62";
        hash = "sha256-NEosGQcEB1r3q3BQN50iXegYqqhu6n6+/reBIbCaSVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ament_cmake";
  version = "3.6.0-1";
  src = sources.launch_testing_ament_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test launch_testing python_cmake_module ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_test launch_testing python_cmake_module ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

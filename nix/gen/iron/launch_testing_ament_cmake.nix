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
        rev = "7b54dd65e46db169e5b68845aa4f8ffddaee9bea";
        hash = "sha256-qy02LEPsVInoMQs/PCyM3q9WTNrDZvmJYKy9FJr+fTg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ament_cmake";
  version = "2.0.4-1";
  src = sources.launch_testing_ament_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test launch_testing python_cmake_module ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_test launch_testing python_cmake_module ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

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
        rev = "18fd05aede8f82f587ce2af385881be2dcf63230";
        hash = "sha256-SB9K3JSpY/IoUxCBQA+4bQi1cnnXlsXcNpsR0GOEjMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ament_cmake";
  version = "1.0.6-1";
  src = sources.launch_testing_ament_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test launch_testing python_cmake_module ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_test launch_testing python_cmake_module ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

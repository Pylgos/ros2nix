{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_python,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google_benchmark_vendor,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_google_benchmark = substituteSource {
      src = fetchgit {
        name = "ament_cmake_google_benchmark-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "033b576764f8709c7dca5d1283dd627b63a4e2b1";
        hash = "sha256-B3yP3cOFOd5nJ2WBofljzuF6c7S1BGPU4SjTrYeB/io=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_google_benchmark";
  version = "2.0.5-1";
  src = sources.ament_cmake_google_benchmark;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_test google_benchmark_vendor ];
  buildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake_test google_benchmark_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

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
        rev = "e22625d27070a9f44839e10584f13b0578fc4f59";
        hash = "sha256-xC25JFRKycC43JYkXX7rjShkzXWNw0C1wcENYrIPqPY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_google_benchmark";
  version = "1.3.9-1";
  src = sources.ament_cmake_google_benchmark;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_test google_benchmark_vendor ];
  buildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake_test google_benchmark_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

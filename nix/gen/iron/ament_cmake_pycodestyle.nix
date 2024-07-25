{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pycodestyle = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "feeed0cb2453138fc2e855de37a9a0aeaa7d9fa5";
        hash = "sha256-+aT3QALBMnSON3HfHKGQUeGYv7NmSWZI8Mce7Q1NUx0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pycodestyle";
  version = "0.14.3-1";
  src = sources.ament_cmake_pycodestyle;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pycodestyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

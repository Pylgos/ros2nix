{
  ament_cmake_core,
  ament_cmake_test,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pytest = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pytest-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "38fe8c537227f1903189d44f42d271f721a58fbf";
        hash = "sha256-Khf4m752TsNX1YtaGDeO+w5zYC2Zh5EE28slsv3mbw4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pytest";
  version = "1.3.9-1";
  src = sources.ament_cmake_pytest;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test python3Packages.pytest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

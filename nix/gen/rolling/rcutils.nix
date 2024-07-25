{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ament_cmake,
  mimick_vendor,
  osrf_testing_tools_cpp,
  performance_test_fixture,
  substituteSource,
}:
let
  sources = rec {
    rcutils = substituteSource {
      src = fetchgit {
        name = "rcutils-source";
        url = "https://github.com/ros2-gbp/rcutils-release.git";
        rev = "9cabe7839211fabed652cc29ef6c2321fa58a168";
        hash = "sha256-50Y1n0SJqa/lDYSepBm5nOodqDNcUOEu0pAIS3f0xHU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcutils";
  version = "6.9.0-1";
  src = sources.rcutils;
  nativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

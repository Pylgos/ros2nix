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
        rev = "d7dfc70c7e63ae0841b9670f568b3d97b009c432";
        hash = "sha256-hJEB9nr7nyolT3mcSg8wNFOxJrJvaEtIDJh7oFq0JbM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcutils";
  version = "5.1.6-1";
  src = sources.rcutils;
  nativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

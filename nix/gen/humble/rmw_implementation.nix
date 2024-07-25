{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcpputils,
  rcutils,
  rmw,
  rmw_connextdds,
  rmw_cyclonedds_cpp,
  rmw_fastrtps_cpp,
  rmw_fastrtps_dynamic_cpp,
  rmw_gurumdds_cpp,
  rmw_implementation_cmake,
  substituteSource,
}:
let
  sources = rec {
    rmw_implementation = substituteSource {
      src = fetchgit {
        name = "rmw_implementation-source";
        url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
        rev = "cfbc76ace55a18089e7620962ad152f4c5d32ebb";
        hash = "sha256-st97+cEQR/VohjF5RnDe+35KlvzJHywawr8vwvQbz4E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation";
  version = "2.8.3-1";
  src = sources.rmw_implementation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp rmw rmw_implementation_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcpputils rcutils rmw_connextdds rmw_cyclonedds_cpp rmw_fastrtps_cpp rmw_fastrtps_dynamic_cpp rmw_gurumdds_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

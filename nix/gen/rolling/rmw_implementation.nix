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
  rmw_implementation_cmake,
  substituteSource,
}:
let
  sources = rec {
    rmw_implementation = substituteSource {
      src = fetchgit {
        name = "rmw_implementation-source";
        url = "https://github.com/ros2-gbp/rmw_implementation-release.git";
        rev = "696185ed7c9a66d4a723c6f613d14cccce427d6e";
        hash = "sha256-mG3cnHjKTyGqqVw9z+HRMkpxdpprpRxvSLke3q9m/cw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_implementation";
  version = "3.0.0-1";
  src = sources.rmw_implementation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rmw_implementation_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp rcpputils rcutils rmw rmw_connextdds rmw_cyclonedds_cpp rmw_fastrtps_cpp rmw_fastrtps_dynamic_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

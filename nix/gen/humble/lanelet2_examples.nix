{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_io,
  lanelet2_matching,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  ros2cli,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_examples = substituteSource {
      src = fetchgit {
        name = "lanelet2_examples-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "f9dd2b00ece1ce368e4c1d6578d2605065767b7f";
        hash = "sha256-jbMdHabSoOnjj7zKI54sz2P3Nrq8NRpYCHYb7pekzX0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_examples";
  version = "1.2.1-1";
  src = sources.lanelet2_examples;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_io lanelet2_matching lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

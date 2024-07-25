{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_io,
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
        rev = "70e3487b54c323852560c2c41f4d12d494cc7065";
        hash = "sha256-r9Uj64Lgu/hODrKwkACMfUdwdOk9wBWovMNWD5KjTvM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_examples";
  version = "1.1.1-5";
  src = sources.lanelet2_examples;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_io lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  lanelet2_examples,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    lanelet2 = substituteSource {
      src = fetchgit {
        name = "lanelet2-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "1801bdcdecb59da997319097f7e60dcce5ba7ca7";
        hash = "sha256-xW2nmdxh/bfs+AVc/+WN+rgfRzsuy9u8TH7w21x7g90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2";
  version = "1.1.1-5";
  src = sources.lanelet2;
  nativeBuildInputs = [ ament_cmake_core ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_examples lanelet2_io lanelet2_maps lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules lanelet2_validation ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

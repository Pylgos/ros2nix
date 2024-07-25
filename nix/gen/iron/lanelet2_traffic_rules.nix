{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  mrt_cmake_modules,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_traffic_rules = substituteSource {
      src = fetchgit {
        name = "lanelet2_traffic_rules-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "159f83d59d83732804ab962e3c58589db2dc07b8";
        hash = "sha256-f8lvg45yjWovjMCmp3Pdmr6KFejBnczY67qkvP5uFWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_traffic_rules";
  version = "1.1.1-5";
  src = sources.lanelet2_traffic_rules;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

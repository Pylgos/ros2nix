{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_routing = substituteSource {
      src = fetchgit {
        name = "lanelet2_routing-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "c6fcbf60835230a5572c0dc686f37421fa71bd42";
        hash = "sha256-bcQwF0woqvqfOeIO7haHyco3dmf6CNAotcyEVFPHkGk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_routing";
  version = "1.1.1-5";
  src = sources.lanelet2_routing;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_traffic_rules python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

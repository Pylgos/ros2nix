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
  lanelet2_routing,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_python = substituteSource {
      src = fetchgit {
        name = "lanelet2_python-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "a8749b333ad51109e8bd10dd07ec83a0acb6be29";
        hash = "sha256-SfwKuO3PAhugfhidN7+7VHGaegF4UPhoRdhpJ3xjBIo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_python";
  version = "1.1.1-5";
  src = sources.lanelet2_python;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core lanelet2_io lanelet2_projection lanelet2_routing lanelet2_traffic_rules python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

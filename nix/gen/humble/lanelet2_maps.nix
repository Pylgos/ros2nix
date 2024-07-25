{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  mrt_cmake_modules,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_maps = substituteSource {
      src = fetchgit {
        name = "lanelet2_maps-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "a8e21efb90eccba170052cce25f4d1eb2533e8fb";
        hash = "sha256-neyAYG4BaHOn/2vqAXGTk6mFwmVeutNUc/jdcl7B1HY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_maps";
  version = "1.2.1-1";
  src = sources.lanelet2_maps;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

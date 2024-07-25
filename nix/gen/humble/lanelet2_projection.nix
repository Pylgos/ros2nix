{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographiclib,
  gtest,
  lanelet2_io,
  mrt_cmake_modules,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_projection = substituteSource {
      src = fetchgit {
        name = "lanelet2_projection-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "cd666d5a741d770fa6d630244a47fc0faed6387d";
        hash = "sha256-o4Gx/d7ijKvebHUq8BO78HeTfCKTIkE1raVOjESdhR4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_projection";
  version = "1.2.1-1";
  src = sources.lanelet2_projection;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geographiclib lanelet2_io ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

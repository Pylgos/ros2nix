{
  ament_cmake_core,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  mrt_cmake_modules,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_core = substituteSource {
      src = fetchgit {
        name = "lanelet2_core-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "fa0a71cd74e5c6effcbe85435d5ba7a1d4d30f62";
        hash = "sha256-Nz/Uglhw2hDL1gfYqEdDLJHWEOErA4wg5rDzu3S1wik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_core";
  version = "1.2.1-1";
  src = sources.lanelet2_core;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
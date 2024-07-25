{
  ament_cmake_core,
  ament_cmake_gtest,
  ament_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_gen_version_h = substituteSource {
      src = fetchgit {
        name = "ament_cmake_gen_version_h-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "2584dc6aff6fd7fbb4737efb0ef90d67bfb49139";
        hash = "sha256-E59ye5/yaT4t8fp4pOnoffppdrEsSV6IB6sUeKagmHc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_gen_version_h";
  version = "2.0.5-1";
  src = sources.ament_cmake_gen_version_h;
  nativeBuildInputs = [ ament_package ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [ ament_package ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

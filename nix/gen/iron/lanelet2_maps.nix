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
        rev = "93bd594ccebb4d9645bdbd729c6edee6cd530fdd";
        hash = "sha256-iDbAH06Tpfjgf4La3huKzwojpdvk7EPzGsU65+td7z8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_maps";
  version = "1.1.1-5";
  src = sources.lanelet2_maps;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

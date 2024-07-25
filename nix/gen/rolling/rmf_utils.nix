{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmf_utils = substituteSource {
      src = fetchgit {
        name = "rmf_utils-source";
        url = "https://github.com/ros2-gbp/rmf_utils-release.git";
        rev = "b2d4278fa266a69fc67541c312a63c564ba7c76b";
        hash = "sha256-HLMPR4URpPvTGbv5K1BOi9vXURKEkU23kbIAnYHNMaA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_utils";
  version = "1.7.0-1";
  src = sources.rmf_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
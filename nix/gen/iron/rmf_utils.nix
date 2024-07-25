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
        rev = "d62a9500eb8d8ac13b4c72549547f53ec6f88f7a";
        hash = "sha256-0kDu8uYSEiCHoE6pVhltvaEQr8XVjNTlcZ6bUQSGW74=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_utils";
  version = "1.5.1-1";
  src = sources.rmf_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

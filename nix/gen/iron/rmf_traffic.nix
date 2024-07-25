{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  libccd,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic = substituteSource {
      src = fetchgit {
        name = "rmf_traffic-source";
        url = "https://github.com/ros2-gbp/rmf_traffic-release.git";
        rev = "5cfc70ff9df6e4bc35d2963fea51f33a6d49785e";
        hash = "sha256-RI10cGxoWZbIeOrS/VipUFA/arlJk7AGR1xvwj61lHI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic";
  version = "3.1.2-1";
  src = sources.rmf_traffic;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libccd rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

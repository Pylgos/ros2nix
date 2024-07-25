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
        rev = "aa40c2fd0508ae499e9461114bf82e4f7c1a8acf";
        hash = "sha256-54iHCHq5kArMqB1OaqHdA5MPQ2efGpulPua1QGezQCA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic";
  version = "3.0.3-1";
  src = sources.rmf_traffic;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libccd rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

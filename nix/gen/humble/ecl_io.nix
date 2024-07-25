{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_io = substituteSource {
      src = fetchgit {
        name = "ecl_io-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "4eb92381bf158e5980256ed26f8aae40413783c9";
        hash = "sha256-I434FhFkRvH1CxPDYASTtfmyT/mK0OLoVA+VPEiSa24=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_io";
  version = "1.2.0-1";
  src = sources.ecl_io;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

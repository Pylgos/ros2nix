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
    ecl_exceptions = substituteSource {
      src = fetchgit {
        name = "ecl_exceptions-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "fc2794f9b8875151da443d274c33c4e33ff4d892";
        hash = "sha256-vSUx0IaohNthgxC/EHPPCyDY6YrVAcZUT4u5L099eA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_exceptions";
  version = "1.2.1-1";
  src = sources.ecl_exceptions;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

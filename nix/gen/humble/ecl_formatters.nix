{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_converters,
  ecl_exceptions,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_formatters = substituteSource {
      src = fetchgit {
        name = "ecl_formatters-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "72c0315b06e1d7ac44f953715b178feb3036c9b7";
        hash = "sha256-KJ9Xhcl2ACKk7qJz2OTu+dVkgzMcvIBEwmXdl0NaiKg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_formatters";
  version = "1.2.1-1";
  src = sources.ecl_formatters;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_converters ecl_exceptions ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

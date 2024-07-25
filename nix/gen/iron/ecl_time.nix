{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_exceptions,
  ecl_license,
  ecl_time_lite,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_time = substituteSource {
      src = fetchgit {
        name = "ecl_time-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "d7055872a565a4039fcd1790c974e4a8f6562dac";
        hash = "sha256-SC1B6uuNMjWdHD10L5nXdVvgkguZSiwRc1i/zONxu5E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_time";
  version = "1.2.1-4";
  src = sources.ecl_time;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_exceptions ecl_license ecl_time_lite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

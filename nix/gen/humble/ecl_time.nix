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
        rev = "6d75d4262871de340809bffdaa6b3b5abfab2386";
        hash = "sha256-SC1B6uuNMjWdHD10L5nXdVvgkguZSiwRc1i/zONxu5E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_time";
  version = "1.2.1-1";
  src = sources.ecl_time;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_exceptions ecl_license ecl_time_lite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

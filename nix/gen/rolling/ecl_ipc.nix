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
  ecl_threads,
  ecl_time,
  ecl_time_lite,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_ipc = substituteSource {
      src = fetchgit {
        name = "ecl_ipc-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "ad04db545c181ad8f345bd60885142552ddd44c1";
        hash = "sha256-VScic0GudpLDyw3R7bdxdgKjaPeyx0ynFGMpfB66eRo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_ipc";
  version = "1.2.1-4";
  src = sources.ecl_ipc;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_exceptions ecl_license ecl_threads ecl_time ecl_time_lite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

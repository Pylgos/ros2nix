{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_concepts,
  ecl_config,
  ecl_errors,
  ecl_exceptions,
  ecl_license,
  ecl_time,
  ecl_utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_threads = substituteSource {
      src = fetchgit {
        name = "ecl_threads-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "9c8d0fd7fa1235ba4439c41fbfc2ec61bfb2d349";
        hash = "sha256-4lhOg9DicobrUw8Xel3vSP7jrgFI9obXn6dYbQEyFHA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_threads";
  version = "1.2.1-5";
  src = sources.ecl_threads;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_concepts ecl_config ecl_errors ecl_exceptions ecl_license ecl_time ecl_utilities ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
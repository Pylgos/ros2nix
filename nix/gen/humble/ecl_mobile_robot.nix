{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_errors,
  ecl_formatters,
  ecl_geometry,
  ecl_license,
  ecl_linear_algebra,
  ecl_math,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_mobile_robot = substituteSource {
      src = fetchgit {
        name = "ecl_mobile_robot-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "4c1768ae0bace52f474e88d6ee0d0cd4b5aae973";
        hash = "sha256-NQJy3LdrqwiDAynl1fLCbDJz/A4qCxq6VpeaO+fr/4Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_mobile_robot";
  version = "1.2.1-1";
  src = sources.ecl_mobile_robot;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_errors ecl_formatters ecl_geometry ecl_license ecl_linear_algebra ecl_math ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

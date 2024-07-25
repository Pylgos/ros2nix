{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_containers,
  ecl_exceptions,
  ecl_formatters,
  ecl_license,
  ecl_linear_algebra,
  ecl_math,
  ecl_mpl,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_geometry = substituteSource {
      src = fetchgit {
        name = "ecl_geometry-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "54f226a9f1b6ea2dc00e0b730ad1b76fcb3c901a";
        hash = "sha256-XXr9pl1hLn7gS04rAzdTRXa+Fe0p4Mn7sC0scLWC2Zc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_geometry";
  version = "1.2.1-1";
  src = sources.ecl_geometry;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_containers ecl_exceptions ecl_formatters ecl_license ecl_linear_algebra ecl_math ecl_mpl ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

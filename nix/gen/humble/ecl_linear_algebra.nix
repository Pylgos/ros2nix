{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_converters,
  ecl_eigen,
  ecl_exceptions,
  ecl_formatters,
  ecl_license,
  ecl_math,
  fetchgit,
  fetchurl,
  fetchzip,
  sophus,
  substituteSource,
}:
let
  sources = rec {
    ecl_linear_algebra = substituteSource {
      src = fetchgit {
        name = "ecl_linear_algebra-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "c0ff6ed885caa1f043e22952d2f2b21907da1221";
        hash = "sha256-2Mofxug8ckLfTnStaTQtx69z6SvToiY8incBV3OMXJo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_linear_algebra";
  version = "1.2.1-1";
  src = sources.ecl_linear_algebra;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_converters ecl_eigen ecl_exceptions ecl_formatters ecl_license ecl_math sophus ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

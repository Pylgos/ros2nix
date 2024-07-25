{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_concepts,
  ecl_license,
  ecl_mpl,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_utilities = substituteSource {
      src = fetchgit {
        name = "ecl_utilities-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "a06384f5d1871a36471167ceea483b0a12a65722";
        hash = "sha256-lr/gRtkjgtYbXIMwa5OUbaSehxs5kKRTATWgZooFnRA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_utilities";
  version = "1.2.1-1";
  src = sources.ecl_utilities;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_concepts ecl_license ecl_mpl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

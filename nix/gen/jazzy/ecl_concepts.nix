{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_concepts = substituteSource {
      src = fetchgit {
        name = "ecl_concepts-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "a0348c6d3a69b498f2e10dc009637ae7751e6329";
        hash = "sha256-hH2MIha8e5l0G1CqvBSjisV52RKAkaE0J9ZtGpxM9EM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_concepts";
  version = "1.2.1-5";
  src = sources.ecl_concepts;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ecl_build ];
  propagatedBuildInputs = [ ecl_config ecl_license ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
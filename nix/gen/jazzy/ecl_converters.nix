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
  ecl_mpl,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_converters = substituteSource {
      src = fetchgit {
        name = "ecl_converters-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "2afba0633775bff93778d25664c02fdb1b7f82c5";
        hash = "sha256-hZthKv3t/fhEc7ubch+5EneflAc54IyTtCuBW4vzaF0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_converters";
  version = "1.2.1-5";
  src = sources.ecl_converters;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ecl_build ];
  propagatedBuildInputs = [ ecl_concepts ecl_config ecl_errors ecl_exceptions ecl_license ecl_mpl ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_converters,
  ecl_errors,
  ecl_exceptions,
  ecl_formatters,
  ecl_license,
  ecl_mpl,
  ecl_type_traits,
  ecl_utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_containers = substituteSource {
      src = fetchgit {
        name = "ecl_containers-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "4432e5f58cc42623cb1afaeecdba4447acd71a2a";
        hash = "sha256-943O8bp1zs58toB05o+e+e5rOiiB7i0OAWEjrbjQ7Ng=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_containers";
  version = "1.2.1-1";
  src = sources.ecl_containers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_converters ecl_errors ecl_exceptions ecl_formatters ecl_license ecl_mpl ecl_type_traits ecl_utilities ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_concepts,
  ecl_converters,
  ecl_devices,
  ecl_errors,
  ecl_license,
  ecl_time,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_streams = substituteSource {
      src = fetchgit {
        name = "ecl_streams-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "73bdd35f128030911ff03e6720e4a5178d89a226";
        hash = "sha256-IpgY894/j+PnAx+KIYX8Wvb7yve2eAvnuYrKq0ZgX0s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_streams";
  version = "1.2.1-5";
  src = sources.ecl_streams;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ecl_build ];
  propagatedBuildInputs = [ ecl_concepts ecl_converters ecl_devices ecl_errors ecl_license ecl_time ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
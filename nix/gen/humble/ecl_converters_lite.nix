{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_config,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_converters_lite = substituteSource {
      src = fetchgit {
        name = "ecl_converters_lite-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "0364dcd35d2ba5aa3cc8b4980707d13ad0fcc40f";
        hash = "sha256-a8sm73bxxx6IYDP6tv76IbjyUHSAzx6QreCCBMQUePE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_converters_lite";
  version = "1.2.0-1";
  src = sources.ecl_converters_lite;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_config ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

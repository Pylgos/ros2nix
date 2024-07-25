{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_config = substituteSource {
      src = fetchgit {
        name = "ecl_config-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "9c847ea42db6203b27473396d5cc2a004246cbe6";
        hash = "sha256-eH0ytH9tso+gcYGQSXy83dIPeklxY5K+/Jo0cV9qAxI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_config";
  version = "1.2.0-1";
  src = sources.ecl_config;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

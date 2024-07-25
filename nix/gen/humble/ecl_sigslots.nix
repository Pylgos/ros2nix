{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  ecl_threads,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_sigslots = substituteSource {
      src = fetchgit {
        name = "ecl_sigslots-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "44da182e2f68211449c74f766438b5767407a7d1";
        hash = "sha256-c5lvTwI1CTmfeMKJsCuyr/ilN2KWeABt+RYdAxB9cdI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_sigslots";
  version = "1.2.1-1";
  src = sources.ecl_sigslots;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ecl_threads ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

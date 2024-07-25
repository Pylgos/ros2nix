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
        rev = "bf1c66ab1688b4bf9d7051d232c5142eceb2d7fa";
        hash = "sha256-c5lvTwI1CTmfeMKJsCuyr/ilN2KWeABt+RYdAxB9cdI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_sigslots";
  version = "1.2.1-4";
  src = sources.ecl_sigslots;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ecl_threads ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

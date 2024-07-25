{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_filesystem = substituteSource {
      src = fetchgit {
        name = "ecl_filesystem-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "a8c6a9121a6ab47eba96e3f49bfcdd138882bd3d";
        hash = "sha256-b9AmUCVBFQ84JFx0ER/eD+2NF6JP/zybtNFnzKAI+dg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_filesystem";
  version = "1.2.1-1";
  src = sources.ecl_filesystem;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

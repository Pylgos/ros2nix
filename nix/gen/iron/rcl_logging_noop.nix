{
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  rcl_logging_interface,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_noop = substituteSource {
      src = fetchgit {
        name = "rcl_logging_noop-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "d31f38fa6ec809b9fc5d30443737254e2bc5cbd3";
        hash = "sha256-BxXlzGl4nSfrc03olnjFe3xz8S6nCfqfqtGm2sF3QcA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_noop";
  version = "2.5.1-2";
  src = sources.rcl_logging_noop;
  nativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

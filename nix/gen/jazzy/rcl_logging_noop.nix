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
        rev = "423b070d9aea34e99dacd881947dfdbeb124c159";
        hash = "sha256-XpmOGX13xXUHBOzLXAuAXWun1j/BzpliZo8V4xX5T94=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_noop";
  version = "3.1.0-2";
  src = sources.rcl_logging_noop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

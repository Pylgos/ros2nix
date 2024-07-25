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
        rev = "8fc4653759f7c6c2b5d0cb0e5ab6346ce4bf6a13";
        hash = "sha256-d65yR48B4ECdv2QS+sMPj/PVQoBGdVjVtgGNo54ybuA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_noop";
  version = "2.3.1-1";
  src = sources.rcl_logging_noop;
  nativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

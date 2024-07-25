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
        rev = "904f481ae1d6376f17313539ceef569343fbec74";
        hash = "sha256-vt6QaycVYIJQi/HoieravFDkDzesOqmBW3O31CtEeOU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_noop";
  version = "3.2.0-1";
  src = sources.rcl_logging_noop;
  nativeBuildInputs = [ ament_cmake_ros buildPackages.python3Packages.empy ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_logging_interface rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt2,
  mrpt_msgs,
  ros_environment,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    mrpt_msgs_bridge = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "587c411bc677e881bf5657186622374506cc4987";
        hash = "sha256-eNG8bYk+y4ccqCxpy+thZLJc94k6b6vmXLpefYFdKV8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_msgs_bridge";
  version = "2.0.0-1";
  src = sources.mrpt_msgs_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common geometry_msgs mrpt2 mrpt_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

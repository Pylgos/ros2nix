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
        rev = "fb975301f59fed28c360512850aa50767e3cf34f";
        hash = "sha256-4gceMkwciWuVgMXFo5+KaGUypXOzMq80ibfqvDITj5Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_msgs_bridge";
  version = "2.0.1-1";
  src = sources.mrpt_msgs_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common geometry_msgs mrpt2 mrpt_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

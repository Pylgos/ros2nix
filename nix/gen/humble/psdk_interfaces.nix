{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    psdk_interfaces = substituteSource {
      src = fetchgit {
        name = "psdk_interfaces-source";
        url = "https://github.com/ros2-gbp/psdk_ros2-release.git";
        rev = "d78976ad33cdf9b6e2609807ed3507a33140cb2d";
        hash = "sha256-Ykg1F8eDzozhBnEATMmhN1dP6FGn60wGyN1hJIudEN4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "psdk_interfaces";
  version = "1.3.1-1";
  src = sources.psdk_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

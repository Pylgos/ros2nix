{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dolly_follow,
  dolly_gazebo,
  dolly_ignition,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    dolly = substituteSource {
      src = fetchgit {
        name = "dolly-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "5d847c8aa319f738c369490da961e87b5e408508";
        hash = "sha256-1ugxemjgNM3QtSsQ64TCZHu8J9gYPS5Qh2s6VRBTiFA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly";
  version = "0.4.0-6";
  src = sources.dolly;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dolly_follow dolly_gazebo dolly_ignition ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

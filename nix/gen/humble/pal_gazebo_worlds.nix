{
  ament_cmake,
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    pal_gazebo_worlds = substituteSource {
      src = fetchgit {
        name = "pal_gazebo_worlds-source";
        url = "https://github.com/pal-gbp/pal_gazebo_worlds-ros2-release.git";
        rev = "606c5e0270684a9ad95126cd224c64322d3849d6";
        hash = "sha256-nolmu4GC8MidX5KaOXedRdbBylzYxPYbtv8fg/sJ4xA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_gazebo_worlds";
  version = "4.0.4-1";
  src = sources.pal_gazebo_worlds;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

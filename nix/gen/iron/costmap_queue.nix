{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_costmap_2d,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    costmap_queue = substituteSource {
      src = fetchgit {
        name = "costmap_queue-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "47b811b77919b60436f3057988015b71ee904054";
        hash = "sha256-4kdVWdSVn/v0UnF0MDEdfnB/C3HK8xDZLBAjZHY90F0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "costmap_queue";
  version = "1.2.9-1";
  src = sources.costmap_queue;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_common nav2_costmap_2d rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

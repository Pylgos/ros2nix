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
        rev = "b116fb4071dd5ab4be705f18d3819be982aaac89";
        hash = "sha256-EP1HBi5zFDwJ83OxjlostbWbUBV2lXnesEylwFV77T0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "costmap_queue";
  version = "1.1.15-1";
  src = sources.costmap_queue;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_common nav2_costmap_2d rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

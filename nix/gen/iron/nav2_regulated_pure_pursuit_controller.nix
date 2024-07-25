{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    nav2_regulated_pure_pursuit_controller = substituteSource {
      src = fetchgit {
        name = "nav2_regulated_pure_pursuit_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "cb11eb6ec3ce930a9718b4b3bbd39c6b9e41a157";
        hash = "sha256-bpnpoGsSX5PziPBcQBF/wgkAUg19Wb7G0j9iG4lyNlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_regulated_pure_pursuit_controller";
  version = "1.2.9-1";
  src = sources.nav2_regulated_pure_pursuit_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

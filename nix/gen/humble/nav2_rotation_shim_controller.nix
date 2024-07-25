{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_controller,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_regulated_pure_pursuit_controller,
  nav2_util,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    nav2_rotation_shim_controller = substituteSource {
      src = fetchgit {
        name = "nav2_rotation_shim_controller-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "bd740d9ac2fd96a2743fe0dc41d0a31615c25477";
        hash = "sha256-OP9gIOqjOw2HksV8X9ohL0Lz4Y9nGsXMl8vDT2bcoq0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_rotation_shim_controller";
  version = "1.1.15-1";
  src = sources.nav2_rotation_shim_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

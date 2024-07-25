{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  builtin_interfaces,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  nlohmann_json,
  ompl,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  substituteSource,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_smac_planner = substituteSource {
      src = fetchgit {
        name = "nav2_smac_planner-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "95b5715986d93cfdeaad550a2adc1a431383226c";
        hash = "sha256-G82XocP3Bsyca7ew+fhXGAncnxzsNEsEUYpI0th6Odw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_smac_planner";
  version = "1.1.15-1";
  src = sources.nav2_smac_planner;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles builtin_interfaces eigen geometry_msgs nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util nav_msgs nlohmann_json ompl pluginlib rclcpp rclcpp_action rclcpp_lifecycle tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_amcl,
  nav2_behavior_tree,
  nav2_behaviors,
  nav2_bt_navigator,
  nav2_collision_monitor,
  nav2_constrained_smoother,
  nav2_controller,
  nav2_core,
  nav2_costmap_2d,
  nav2_dwb_controller,
  nav2_lifecycle_manager,
  nav2_map_server,
  nav2_mppi_controller,
  nav2_msgs,
  nav2_navfn_planner,
  nav2_planner,
  nav2_regulated_pure_pursuit_controller,
  nav2_rotation_shim_controller,
  nav2_rviz_plugins,
  nav2_simple_commander,
  nav2_smac_planner,
  nav2_smoother,
  nav2_theta_star_planner,
  nav2_util,
  nav2_velocity_smoother,
  nav2_voxel_grid,
  nav2_waypoint_follower,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    navigation2 = substituteSource {
      src = fetchgit {
        name = "navigation2-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "305886746676577d6e316dbc27f78583678f82ce";
        hash = "sha256-fBGdWL77wN/yiahzmI/o6A2hdaafQz6fSIAejlkBlgo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "navigation2";
  version = "1.1.15-1";
  src = sources.navigation2;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_amcl nav2_behavior_tree nav2_behaviors nav2_bt_navigator nav2_collision_monitor nav2_constrained_smoother nav2_controller nav2_core nav2_costmap_2d nav2_dwb_controller nav2_lifecycle_manager nav2_map_server nav2_mppi_controller nav2_msgs nav2_navfn_planner nav2_planner nav2_regulated_pure_pursuit_controller nav2_rotation_shim_controller nav2_rviz_plugins nav2_simple_commander nav2_smac_planner nav2_smoother nav2_theta_star_planner nav2_util nav2_velocity_smoother nav2_voxel_grid nav2_waypoint_follower ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
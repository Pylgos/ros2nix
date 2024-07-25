{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_core,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2_eigen,
  tf2_eigen_kdl,
  tf2_geometry_msgs,
  tf2_kdl,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_resources_prbt_ikfast_manipulator_plugin = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_ikfast_manipulator_plugin-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e16f23c7b6a2974f8ccfcb68391c683d611f980f";
        hash = "sha256-+pKfoRP2yU9UdsH7ol126DWb0R4rkzLiZ7MTCNXHdJs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_ikfast_manipulator_plugin";
  version = "2.5.5-1";
  src = sources.moveit_resources_prbt_ikfast_manipulator_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_core pluginlib rclcpp tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

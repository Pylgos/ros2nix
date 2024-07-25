{
  ament_cmake,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rmf_building_map_msgs,
  rmf_dispenser_msgs,
  rmf_fleet_msgs,
  rmf_ingestor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    rmf_robot_sim_common = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "65d8f2fd48c6bccb17b6b154f88517a9e44c5b19";
        hash = "sha256-uTUHiLRTaN1nezHOYoCGPMgre3DZnfbMYEyBwR7lIiI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_common";
  version = "2.0.2-1";
  src = sources.rmf_robot_sim_common;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs rclcpp rmf_building_map_msgs rmf_dispenser_msgs rmf_fleet_msgs rmf_ingestor_msgs std_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

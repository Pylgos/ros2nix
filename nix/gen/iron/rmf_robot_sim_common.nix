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
        rev = "09fb632e99438125931e7259dff9288d5b222193";
        hash = "sha256-Nmo8OmfnoBtcoyFeiETtWt5c+XNwBlKHe/XLL0VsHAI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_common";
  version = "2.1.2-1";
  src = sources.rmf_robot_sim_common;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs rclcpp rmf_building_map_msgs rmf_dispenser_msgs rmf_fleet_msgs rmf_ingestor_msgs std_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

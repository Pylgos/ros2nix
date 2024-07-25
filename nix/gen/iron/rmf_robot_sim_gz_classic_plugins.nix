{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_ros,
  geometry_msgs,
  rclcpp,
  rmf_building_map_msgs,
  rmf_fleet_msgs,
  rmf_robot_sim_common,
  substituteSource,
}:
let
  sources = rec {
    rmf_robot_sim_gz_classic_plugins = substituteSource {
      src = fetchgit {
        name = "rmf_robot_sim_gz_classic_plugins-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "6f4b454c4ee3fe0e7f08f3e300934925a2551558";
        hash = "sha256-fyzdviXblvUjQfo786x30UXpUDCDUisd8N7DtHHn+Co=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_gz_classic_plugins";
  version = "2.1.2-1";
  src = sources.rmf_robot_sim_gz_classic_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen gazebo_dev gazebo_ros geometry_msgs rclcpp rmf_building_map_msgs rmf_fleet_msgs rmf_robot_sim_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

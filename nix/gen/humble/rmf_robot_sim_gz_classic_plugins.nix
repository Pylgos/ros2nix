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
        rev = "19b7c05afa820414df40243e5b8cead405b78289";
        hash = "sha256-Dua6LF6jMjkqzXcKxt/RDy77YbdgN3KmG+5pzTeR48Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_robot_sim_gz_classic_plugins";
  version = "2.0.2-1";
  src = sources.rmf_robot_sim_gz_classic_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen gazebo_dev gazebo_ros geometry_msgs rclcpp rmf_building_map_msgs rmf_fleet_msgs rmf_robot_sim_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

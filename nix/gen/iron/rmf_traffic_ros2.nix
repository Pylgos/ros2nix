{
  ament_cmake,
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  nlohmann_json,
  proj,
  rclcpp,
  rmf_building_map_msgs,
  rmf_fleet_msgs,
  rmf_site_map_msgs,
  rmf_traffic,
  rmf_traffic_msgs,
  rmf_utils,
  substituteSource,
  util-linux,
  zlib,
}:
let
  sources = rec {
    rmf_traffic_ros2 = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "2a5aefa9e50116441a51af3d31cd2c939d4bbff0";
        hash = "sha256-ZwddzXAPsIsiEJRaDECXWO7tRl8Xyjgtu/XtQsIZCGM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_ros2";
  version = "2.2.5-1";
  src = sources.rmf_traffic_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libyamlcpp nlohmann_json proj rclcpp rmf_building_map_msgs rmf_fleet_msgs rmf_site_map_msgs rmf_traffic rmf_traffic_msgs rmf_utils util-linux zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

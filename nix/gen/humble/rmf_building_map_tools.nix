{
  ament_index_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libyamlcpp,
  python3Packages,
  rclpy,
  rmf_building_map_msgs,
  rmf_site_map_msgs,
  sqlite,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_building_map_tools = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "bf63e8bde41ad8fe70400e0550915056a8359e34";
        hash = "sha256-2RaCSWjWjnuB12Zg5xjLMvSGsZjLtw/mXNIpx7NKfGs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_map_tools";
  version = "1.6.2-1";
  src = sources.rmf_building_map_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyamlcpp python3Packages.fiona python3Packages.pyproj python3Packages.requests python3Packages.shapely rclpy rmf_building_map_msgs rmf_site_map_msgs sqlite std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

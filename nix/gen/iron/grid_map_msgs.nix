{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  grid_map_cmake_helpers,
  rclcpp,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    grid_map_msgs = substituteSource {
      src = fetchgit {
        name = "grid_map_msgs-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "c8b7b02e89ae4bb7343968a92606e001a018f334";
        hash = "sha256-383zrlOc+7JortBCPQbsrGYjWNzYtZmUjuVdSfoAI5k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_msgs";
  version = "2.1.0-1";
  src = sources.grid_map_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs grid_map_cmake_helpers rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

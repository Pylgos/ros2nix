{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  menge_vendor,
  rclcpp,
  rmf_building_map_msgs,
  rmf_door_msgs,
  rmf_lift_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_building_sim_common = substituteSource {
      src = fetchgit {
        name = "rmf_building_sim_common-source";
        url = "https://github.com/ros2-gbp/rmf_simulation-release.git";
        rev = "496355830bb176b77099167ece52f1aab1c9dcc3";
        hash = "sha256-Gq4WnPah+//zNamJOEawrwx5aWlvIY955IcYJEF43XQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_sim_common";
  version = "2.0.2-1";
  src = sources.rmf_building_sim_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ menge_vendor rclcpp rmf_building_map_msgs rmf_door_msgs rmf_lift_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

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
        rev = "d80195f8a48c47172cc1a73d39965045fe5b01cd";
        hash = "sha256-cGiBYyBQvxJAck2NLeL4TvUXrg9+L+sgP3Y14n6t7B4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_sim_common";
  version = "2.1.2-1";
  src = sources.rmf_building_sim_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ menge_vendor rclcpp rmf_building_map_msgs rmf_door_msgs rmf_lift_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

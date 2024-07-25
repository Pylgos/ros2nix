{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rmf_fleet_msgs,
  rmf_utils,
  rmf_visualization_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_fleet_states = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_fleet_states-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "bb6c94523d8aa1098157a22025c452a926cb949a";
        hash = "sha256-RXrZl53NepBUwQoftVaXnoHoJM3gBLT7/s1uqvrdSi0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_fleet_states";
  version = "2.1.2-1";
  src = sources.rmf_visualization_fleet_states;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rmf_fleet_msgs rmf_visualization_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

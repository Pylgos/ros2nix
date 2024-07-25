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
        rev = "63e323d3d4ab372dba86131b1263dbaf9d9080e2";
        hash = "sha256-bbF0ZN4SZBgBFWwZNUY1qF2hg7KRjLvxIillCw+1dI0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_fleet_states";
  version = "2.0.2-1";
  src = sources.rmf_visualization_fleet_states;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rmf_fleet_msgs rmf_visualization_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

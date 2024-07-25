{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mp2p_icp,
  mrpt2,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
}:
let
  sources = rec {
    mrpt_pointcloud_pipeline = substituteSource {
      src = fetchgit {
        name = "mrpt_pointcloud_pipeline-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "2637d98afe715c2769974ddbb2c7dd06760a5aff";
        hash = "sha256-bjQ/GNeTXz1ULPbBHr3M5valz626pDhLLRAIzblLjrg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pointcloud_pipeline";
  version = "2.0.0-1";
  src = sources.mrpt_pointcloud_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common mp2p_icp mrpt2 nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

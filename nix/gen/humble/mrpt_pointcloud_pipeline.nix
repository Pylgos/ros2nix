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
        rev = "dc168f6bb3a22dbd984f50817faf46f8f6b1a864";
        hash = "sha256-18S/g2WxABTDE1iXTcAZTGfCgqz1uqTJV6jqmHCUoAk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_pointcloud_pipeline";
  version = "2.0.1-1";
  src = sources.mrpt_pointcloud_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mp2p_icp mrpt2 nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

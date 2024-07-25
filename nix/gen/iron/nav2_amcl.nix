{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  launch_testing,
  message_filters,
  nav2_common,
  nav2_msgs,
  nav2_util,
  nav_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    nav2_amcl = substituteSource {
      src = fetchgit {
        name = "nav2_amcl-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "7401174e17f11aa990b6c98151e0ef99eabc42e8";
        hash = "sha256-RsN3CNCfSgZioDB3vuH94iJLisH8/gLXzxIPNnpwpPw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_amcl";
  version = "1.2.9-1";
  src = sources.nav2_amcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros message_filters nav2_common nav2_msgs nav2_util nav_msgs pluginlib rclcpp sensor_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

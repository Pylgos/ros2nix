{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    raspimouse_fake = substituteSource {
      src = fetchgit {
        name = "raspimouse_fake-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "3990e28d9167991e7f06cd5421dce2f41df27914";
        hash = "sha256-70IpWrTqp3OmfWYWD4Dge/CHJUhbtddceZZmDgQ1lTY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_fake";
  version = "2.1.0-1";
  src = sources.raspimouse_fake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  asio,
  asio_cmake_module,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  io_context,
  lifecycle_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
  udp_msgs,
}:
let
  sources = rec {
    udp_driver = substituteSource {
      src = fetchgit {
        name = "udp_driver-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "4c7b811c6434b5bf501fbcfa65940818ffb96440";
        hash = "sha256-ufshq3ku5f0OLD1L+CJhsfg8tSqLiOzmXueZGXDO9+4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "udp_driver";
  version = "1.2.0-3";
  src = sources.udp_driver;
  nativeBuildInputs = [ ament_cmake_auto asio_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio io_context lifecycle_msgs rclcpp rclcpp_components rclcpp_lifecycle std_msgs udp_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

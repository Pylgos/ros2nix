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
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    serial_driver = substituteSource {
      src = fetchgit {
        name = "serial_driver-source";
        url = "https://github.com/ros2-gbp/transport_drivers-release.git";
        rev = "5b2aceec502435939dfb9392cb8d2a0a4619fffc";
        hash = "sha256-1Oc6jtsGEX0Jaxqs7jdlxu/nZJxZPxvagRST+L9bdwI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "serial_driver";
  version = "1.2.0-3";
  src = sources.serial_driver;
  nativeBuildInputs = [ ament_cmake_auto asio_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio io_context rclcpp rclcpp_components rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}

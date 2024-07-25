{
  ament_cmake_ros,
  ament_lint_auto,
  buildRosPackage,
  canopen_base_driver,
  canopen_core,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    canopen_proxy_driver = substituteSource {
      src = fetchgit {
        name = "canopen_proxy_driver-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "5696c36653be804db962a4f246ee283035ce510c";
        hash = "sha256-ZZ9ONDmKq5rKDB0Zcyb4j/2BZ51APmTKxJtXdCCZceg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_proxy_driver";
  version = "0.2.11-2";
  src = sources.canopen_proxy_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_base_driver canopen_core canopen_interfaces rclcpp rclcpp_components rclcpp_lifecycle std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
